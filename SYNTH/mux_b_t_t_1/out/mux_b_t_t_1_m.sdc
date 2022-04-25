# ####################################################################

#  Created by Genus(TM) Synthesis Solution 18.14-s037_1 on Mon Apr 25 09:58:52 EDT 2022

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1.0fF
set_units -time 1.0ps

# Set the current design
current_design mux_b_t_t_1

create_clock -name "aclk" -period 10000.0 -waveform {0.0 5000.0} [get_ports aclk]
set_clock_transition 150.0 [get_clocks aclk]
set_load -pin_load 15.0 [get_ports {out[3]}]
set_load -pin_load 15.0 [get_ports {out[2]}]
set_load -pin_load 15.0 [get_ports {out[1]}]
set_load -pin_load 15.0 [get_ports {out[0]}]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports grst]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[0][3]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[0][2]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[0][1]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[0][0]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[1][3]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[1][2]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[1][1]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[1][0]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[2][3]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[2][2]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[2][1]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[2][0]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[3][3]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[3][2]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[3][1]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[3][0]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[4][3]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[4][2]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[4][1]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[4][0]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[5][3]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[5][2]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[5][1]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[5][0]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[6][3]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[6][2]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[6][1]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[6][0]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[7][3]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[7][2]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[7][1]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[7][0]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[8][3]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[8][2]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[8][1]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[8][0]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[9][3]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[9][2]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[9][1]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[9][0]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[10][3]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[10][2]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[10][1]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[10][0]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[11][3]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[11][2]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[11][1]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[11][0]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[12][3]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[12][2]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[12][1]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[12][0]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[13][3]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[13][2]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[13][1]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[13][0]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[14][3]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[14][2]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[14][1]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[14][0]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[15][3]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[15][2]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[15][1]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {inputs[15][0]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports select]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {out[3]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {out[2]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {out[1]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {out[0]}]
set_clock_uncertainty -setup 400.0 [get_clocks aclk]
set_clock_uncertainty -hold 400.0 [get_clocks aclk]
