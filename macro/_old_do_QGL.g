; macro for levelling gantry to bed
; it DOES NOT set final z0 !

echo "Starting QGL"
M561
echo "Bed transformation cleared"

if !move.axes[0].homed || !move.axes[1].homed
    echo "Printer was not homed."
    abort

; Turn off noisy Extruder motor
M84 E0

echo "Setting rought Z0"
; sets rough Z=0 and checks for flexplate
M98 P"/macros/setz0.g"

M98 P"/macros/check_flexplate.g"

; Lower currents, speed & accel
M98 P"/macros/speed_probing.g"
;M98 P"/macros/z_current_low.g"		; reduce current to limit potential damages
;M98 P"/macros/xy_current_low.g"	; reduce current to limit potential damages

; Probe the bed at 4 points
echo "Doing 1st pass. Old deviation was: " ^ move.calibration.initial.deviation
M558 K0 H10 F1000 					; increase the depth range, gets the gantry mostly level immediately
M98 P"/sys/bed_probe_points.g"
echo "Doing 2nd pass. Current deviation: " ^ move.calibration.initial.deviation

M558 K0 H10 F120   					; reduce depth range, probe slower for better repeatability
M98 P"/sys/bed_probe_points.g"
echo "Current deviation: " ^ move.calibration.initial.deviation 

M558 K0 H10 F60    					; reduce depth range, probe slower for better repeatability
while move.calibration.initial.deviation > 0.002
	if iterations >= 4
		break
	echo "Deviation over threshold. Executing another pass."	
	M98 P"/sys/bed_probe_points.g"
	echo "Current deviation: " ^ move.calibration.initial.deviation
	continue
echo "Leveling complete"