## Clock signal
set_property PACKAGE_PIN W5 [get_ports clock_100Mhz]
set_property IOSTANDARD LVCMOS33 [get_ports clock_100Mhz]

## Reset button
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

## Next button
set_property PACKAGE_PIN T17 [get_ports nextbtn]
set_property IOSTANDARD LVCMOS33 [get_ports nextbtn]

## Previous button
set_property PACKAGE_PIN W19 [get_ports backbtn]
set_property IOSTANDARD LVCMOS33 [get_ports backbtn]

## Switches (8 bits for number + 1 bit for sign)
set_property PACKAGE_PIN V17 [get_ports {switches[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switches[0]}]

set_property PACKAGE_PIN V16 [get_ports {switches[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switches[1]}]

set_property PACKAGE_PIN W16 [get_ports {switches[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switches[2]}]

set_property PACKAGE_PIN W17 [get_ports {switches[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switches[3]}]

set_property PACKAGE_PIN W15 [get_ports {switches[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switches[4]}]

set_property PACKAGE_PIN V15 [get_ports {switches[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switches[5]}]

set_property PACKAGE_PIN W14 [get_ports {switches[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switches[6]}]

set_property PACKAGE_PIN W13 [get_ports {switches[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switches[7]}]

## Sign bit
set_property PACKAGE_PIN V2 [get_ports {switches[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switches[8]}]

## Operation switches (2 bits)
set_property PACKAGE_PIN R3 [get_ports {op_switches[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {op_switches[0]}]

set_property PACKAGE_PIN W2 [get_ports {op_switches[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {op_switches[1]}]

## LEDs for switch status
set_property PACKAGE_PIN U16 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]

set_property PACKAGE_PIN E19 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]

set_property PACKAGE_PIN U19 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]

set_property PACKAGE_PIN V19 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]

set_property PACKAGE_PIN W18 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]

set_property PACKAGE_PIN U15 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]

set_property PACKAGE_PIN U14 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]

set_property PACKAGE_PIN V14 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]

## Sign bit LED
set_property PACKAGE_PIN V13 [get_ports {led[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[8]}]

## Overflow LED
set_property PACKAGE_PIN U3 [get_ports overflow]
set_property IOSTANDARD LVCMOS33 [get_ports overflow]

## Underflow LED
set_property PACKAGE_PIN P3 [get_ports underflow]
set_property IOSTANDARD LVCMOS33 [get_ports underflow]

## Seven-segment LED display
set_property PACKAGE_PIN W7 [get_ports {Cathode_out[6]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {Cathode_out[6]}] 
set_property PACKAGE_PIN W6 [get_ports {Cathode_out[5]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {Cathode_out[5]}] 
set_property PACKAGE_PIN U8 [get_ports {Cathode_out[4]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {Cathode_out[4]}] 
set_property PACKAGE_PIN V8 [get_ports {Cathode_out[3]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {Cathode_out[3]}] 
set_property PACKAGE_PIN U5 [get_ports {Cathode_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Cathode_out[2]}] 
set_property PACKAGE_PIN V5 [get_ports {Cathode_out[1]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {Cathode_out[1]}] 
set_property PACKAGE_PIN U7 [get_ports {Cathode_out[0]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {Cathode_out[0]}] 
set_property PACKAGE_PIN V7 [get_ports dp] 
set_property IOSTANDARD LVCMOS33 [get_ports dp] 
set_property PACKAGE_PIN U2 [get_ports {Anode_Activate[0]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {Anode_Activate[0]}] 
set_property PACKAGE_PIN U4 [get_ports {Anode_Activate[1]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {Anode_Activate[1]}] 
set_property PACKAGE_PIN V4 [get_ports {Anode_Activate[2]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {Anode_Activate[2]}] 
set_property PACKAGE_PIN W4 [get_ports {Anode_Activate[3]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {Anode_Activate[3]}]

## Configuration Settings
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

## Done signal
set_property PACKAGE_PIN T17 [get_ports done]
set_property IOSTANDARD LVCMOS33 [get_ports done]
