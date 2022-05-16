; Macro for sampling mesh at running temps

M98 P"/macros/magprobe_attach.g"

G29 S2

echo "Setting Probe Offset"
M98 P"/macros/magprobe_set_offset.g"

M558 K0 H2 F120 T18000
G31 K0

echo "Starting MESH sampling"
G29			; run mesh samplig procedure
echo "MESH samplig sequence completed"

M98 P"/macros/magprobe_dock.g"