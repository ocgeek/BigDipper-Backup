; MACRO for unloading the filament and form the tip

M98 P"/macros/goto_filament_loading.g"

M291 P"Please wait while the nozzle is being heated up" R"Unloading Filament" T5 ; Display message
M109 S245

M98 P"/macros/boop.g"
M291 P"Retracting filament..." R"Unloading Filament" T5 	; Display new message

; forming the filament tip
G1 E4.0 F500 		
G1 E-12.0 F1500
G4 S1 
G1 E-10.0 F300
G4 S1
G1 E-20.0 F700
G1 E-80.0 F700
M400 			; Wait for moves to complete

M292 													; Hide the message
M291 P"Uloaded filament..." R"Unloading complete" T5 	; Display new message
M104 S0 												; Turn off the heater
M84 E0 													; Turn off extruder drive
M98 P"/macros/boop.g"
M98 P"/macros/boop.g"
M98 P"/macros/led_status_print_end.g"