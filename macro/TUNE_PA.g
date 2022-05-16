; macro for tuing PA with a PA tower

; increments target is to get PA = 0.04 at layer 100
; each layer increment PA of 0.04/100

M572 D0 S{global.current_layer*0.0004}
echo "PA set to " , global.current_layer*0.0004

