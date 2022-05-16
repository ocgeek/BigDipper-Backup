G91								; relative positioning
M83                             ; extruder relative positioning
G1 E-10 F1000                 	; retract 5mm of filament
G1 Z1.00 X20.0 Y20.0 F20000     ; short quick move to disengage from print
G1 Z10.00  F20000               ; move Z-Axis 10mm away from part
G90                             ; absolute positioning
G1 X310 Y310 F9000              ; move to home

M104 S0                         ; turn off hotend
M140 S0                         ; turn off heatbed
M106 P0 S0                      ; shut off blower

;G4 S600							; wait 3 mins

M98 P"/macros/led_status_print_end.g"
M98 P"/macros/play_music.g"
G90