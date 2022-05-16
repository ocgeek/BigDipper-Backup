; MACRO for unloading the filament and form the tip

M291 P"Please wait while the nozzle is being heated up" R"Unloading Filament" T5 ; Display message
M109 S235

M98 P"/macros/boop.g"
M291 P"Retracting filament..." R"Unloading Filament" T5 	; Display new message

; forming the filament tip

M83
G1 E35.0 F300 		
G1 E-45.0 F800
G1 E-100.0 F700
M400 			; Wait for moves to complete

M292 													; Hide the message
M291 P"Uloaded filament..." R"Unloading complete" T5 	; Display new message
M104 S0 												; Turn off the heater

M98 P"/macros/boop.g"
M98 P"/macros/boop.g"
