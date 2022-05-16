; Macro to preheat the chamber before starting print

var temp_time = state.time		; used as temporary time
var heating_time = state.time	; track the time passes in preheat status

; test start measuring time

set var.heating_time = state.time
echo "Start of preheating " , var.heating_time

G4 S10	; waits 10 seconds

echo "Time passed = " , state.time-var.heating_time

