; Sets speeds for printing operation

M566 X600 Y600 Z60 E8000        ; Set maximum instantaneous speed changes (mm/min) aka Jerk
M566 P1
M203 X30000 Y30000 Z3000 E15000 ; Set maximum speeds (mm/min)
M201 X7000 Y7000 Z300 E2000     ; Set maximum accelerations (mm/s^2) 
M204 P7000 T7000                ; Set printing acceleration and travel accelerations
