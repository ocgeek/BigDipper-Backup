; Set the speeds for probing operation

M566 X500 Y500 Z20 E3600        ; Set maximum instantaneous speed changes (mm/min)
M566 P0
M203 X18000 Y18000 Z300 E5000  	; Set maximum speeds (mm/min)
M201 X2000 Y2000 Z100 E800      ; Set maximum accelerations (mm/s^2) 
;M204 P500 T2000                ; Set printing acceleration and travel accelerations

