# ####################################################################

#  Created by Genus(TM) Synthesis Solution 18.14-s037_1 on Sat Apr 23 15:49:16 EDT 2022

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1.0fF
set_units -time 1.0ps

# Set the current design
current_design delay

create_clock -name "aclk" -period 20000.0 -waveform {0.0 10000.0} [get_ports aclk]
set_clock_transition 150.0 [get_clocks aclk]
set_load -pin_load 15.0 [get_ports out]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports grst]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports in]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {delay[6]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {delay[5]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {delay[4]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {delay[3]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {delay[2]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {delay[1]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {delay[0]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports out]
set_clock_uncertainty -setup 400.0 [get_clocks aclk]
set_clock_uncertainty -hold 400.0 [get_clocks aclk]
