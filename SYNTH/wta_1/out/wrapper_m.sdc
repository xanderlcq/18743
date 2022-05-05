# ####################################################################

#  Created by Genus(TM) Synthesis Solution 18.14-s037_1 on Sun Apr 03 19:21:20 EDT 2022

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1.0fF
set_units -time 1.0ps

# Set the current design
current_design wrapper

create_clock -name "aclk" -period 1300.0 -waveform {0.0 650.0} [get_ports aclk]
set_clock_transition 150.0 [get_clocks aclk]
set_load -pin_load 15.0 [get_ports {output_spikes[15]}]
set_load -pin_load 15.0 [get_ports {output_spikes[14]}]
set_load -pin_load 15.0 [get_ports {output_spikes[13]}]
set_load -pin_load 15.0 [get_ports {output_spikes[12]}]
set_load -pin_load 15.0 [get_ports {output_spikes[11]}]
set_load -pin_load 15.0 [get_ports {output_spikes[10]}]
set_load -pin_load 15.0 [get_ports {output_spikes[9]}]
set_load -pin_load 15.0 [get_ports {output_spikes[8]}]
set_load -pin_load 15.0 [get_ports {output_spikes[7]}]
set_load -pin_load 15.0 [get_ports {output_spikes[6]}]
set_load -pin_load 15.0 [get_ports {output_spikes[5]}]
set_load -pin_load 15.0 [get_ports {output_spikes[4]}]
set_load -pin_load 15.0 [get_ports {output_spikes[3]}]
set_load -pin_load 15.0 [get_ports {output_spikes[2]}]
set_load -pin_load 15.0 [get_ports {output_spikes[1]}]
set_load -pin_load 15.0 [get_ports {output_spikes[0]}]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports rst]
set_input_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {input_spikes[15]}]
set_input_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {input_spikes[14]}]
set_input_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {input_spikes[13]}]
set_input_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {input_spikes[12]}]
set_input_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {input_spikes[11]}]
set_input_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {input_spikes[10]}]
set_input_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {input_spikes[9]}]
set_input_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {input_spikes[8]}]
set_input_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {input_spikes[7]}]
set_input_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {input_spikes[6]}]
set_input_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {input_spikes[5]}]
set_input_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {input_spikes[4]}]
set_input_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {input_spikes[3]}]
set_input_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {input_spikes[2]}]
set_input_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {input_spikes[1]}]
set_input_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {input_spikes[0]}]
set_output_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {output_spikes[15]}]
set_output_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {output_spikes[14]}]
set_output_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {output_spikes[13]}]
set_output_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {output_spikes[12]}]
set_output_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {output_spikes[11]}]
set_output_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {output_spikes[10]}]
set_output_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {output_spikes[9]}]
set_output_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {output_spikes[8]}]
set_output_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {output_spikes[7]}]
set_output_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {output_spikes[6]}]
set_output_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {output_spikes[5]}]
set_output_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {output_spikes[4]}]
set_output_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {output_spikes[3]}]
set_output_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {output_spikes[2]}]
set_output_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {output_spikes[1]}]
set_output_delay -clock [get_clocks aclk] -add_delay 260.0 [get_ports {output_spikes[0]}]
set_clock_uncertainty -setup 130.0 [get_clocks aclk]
set_clock_uncertainty -hold 130.0 [get_clocks aclk]
