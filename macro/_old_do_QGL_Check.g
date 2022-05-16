G90
M558 K0 H4 F100
G1 Z5
G1 X30 Y5
echo "checking (30,30) point"
G30 K0 S-1 
G1 Z5
G30 K0 S-1 
G1 Z5
G30 K0 S-1 
G1 Z5

G1 X30 Y245
echo "checking (30,270) point"
G30 K0 S-1
G1 Z5
G30 K0 S-1 
G1 Z5
G30 K0 S-1 
G1 Z5

G1 X270 Y245
echo "checking (270,270) point"
G30 K0 S-1
G1 Z5
G30 K0 S-1 
G1 Z5
G30 K0 S-1 
G1 Z5

G1 X270 Y5
echo "checking (270,30) point"
G30 K0 S-1
G1 Z5	
G30 K0 S-1 
G1 Z5
G30 K0 S-1 
G1 Z5
