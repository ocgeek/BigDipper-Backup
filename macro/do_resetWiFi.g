; macro to rest the card wifi

M291 P"Turning off Wifi now..." R"WIFI RESET"
G4 S1
M552 S-1
G4 S5
M291 P"Enabling WiFi" R"WIFI RESET"
M552 S1
G4 S5
M291 P"Welcome back sir" R"WIFI RESET"
