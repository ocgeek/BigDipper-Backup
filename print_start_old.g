; Macro print start

; Gets the active temperatures set by the slicer (1st layer)
; ------------------------------------------
;	global.bed_temp			is the set active bed temp
;	global.hotend_temp		is the set active hotend temp
M98 P"/macros/get_active_temps.g"

; turns on led in print start mode
; ------------------------------------------
M98 P"/macros/led_status_print_start.g"

; Sets the hotend and bed to 0
M104 S0
M140 S0

; reset baby stepping
M290 S0.00 R0

M98 P"/macros/magprobe_dock.g"
M98 P"/macros/goto_bucket.g"

; sets and waits bed temp to slicer value, then runs QGL (cold noozle)
; ------------------------------------------
echo "Setting Bed Temperature : " , global.bed_temp , " 'C"
M140 S{global.bed_temp}
echo "Waiting for bed heating"
M190 S{global.bed_temp}
echo "Bed Temp reached"

; pre heating hotend
; ------------------------------------------
echo "PreHeating HotEnd"
M104 S140
echo "Waiting for HotEnd (pre)heating"
M109 S140
echo "HotEnd PreHeating completed"

; QGL and final Z0
; ------------------------------------------
M98 P"/macros/magprobe_do_QGL.g"
M98 P"/macros/goto_bucket.g"

; sets and waits hotend temp to slicer value
; ------------------------------------------
echo "Setting HotEnd Temperature : " , global.hotend_temp , " 'C"
M104 S{global.hotend_temp}
echo "Waiting for HotEnd heating"
M109 S{global.hotend_temp}
echo "HotEnd Temp reached"

; retracts to avoid oozing
G91
G1 E-6	
G90

; cleans nozzle before print start
; ------------------------------------------
echo "Cleaning Nozzle"
M98 P"/macros/do_nozzle_wipe.g"		; goes to wipe place and wipes nozzle

; MESH COMPENSATION
; ------------------------------------------
;echo "Sampling Mesh"
;M98 P"/macros/magprobe_do_mesh.g"

;echo "Loading and Enabling Mesh compensation"
G29 S1		; loads heatmap.csv

; Baby stepping for PLA temperatures
;if global.bed_temp < 70
;	echo "Adapting to PLA print temperature"
;	echo "Setting Baby-Step to 0.04 mm"
;	; set baby stepping for PLA (PEI smooth side)
;	M290 S0.04 R0

; extrudes a bit back
G91
G1 E5	
G90

; Final settings before print actually start 
; ------------------------------------------
T0  						; select tool 0
G21  						; set units to mm
M83  						; set extruder to relative mode
G92 E0.0  					; reset extruder position
M220 S100 					; reset speed multiplier

; M593 P"daa" F42 S0.18		; use DAA to cancel ringing

M98 P"/macros/magprobe_dock.g"

G90
G1 Z5
M400
G1 X150 Y150

echo "Print will now start"
