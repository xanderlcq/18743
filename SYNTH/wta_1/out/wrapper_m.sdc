# ####################################################################

#  Created by Genus(TM) Synthesis Solution 18.14-s037_1 on Mon Apr 04 14:19:43 EDT 2022

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1.0fF
set_units -time 1.0ps

# Set the current design
current_design wrapper

create_clock -name "aclk" -period 50000.0 -waveform {0.0 25000.0} [get_ports aclk]
set_clock_transition 150.0 [get_clocks aclk]
set_load -pin_load 15.0 [get_ports {output_spikes[63]}]
set_load -pin_load 15.0 [get_ports {output_spikes[62]}]
set_load -pin_load 15.0 [get_ports {output_spikes[61]}]
set_load -pin_load 15.0 [get_ports {output_spikes[60]}]
set_load -pin_load 15.0 [get_ports {output_spikes[59]}]
set_load -pin_load 15.0 [get_ports {output_spikes[58]}]
set_load -pin_load 15.0 [get_ports {output_spikes[57]}]
set_load -pin_load 15.0 [get_ports {output_spikes[56]}]
set_load -pin_load 15.0 [get_ports {output_spikes[55]}]
set_load -pin_load 15.0 [get_ports {output_spikes[54]}]
set_load -pin_load 15.0 [get_ports {output_spikes[53]}]
set_load -pin_load 15.0 [get_ports {output_spikes[52]}]
set_load -pin_load 15.0 [get_ports {output_spikes[51]}]
set_load -pin_load 15.0 [get_ports {output_spikes[50]}]
set_load -pin_load 15.0 [get_ports {output_spikes[49]}]
set_load -pin_load 15.0 [get_ports {output_spikes[48]}]
set_load -pin_load 15.0 [get_ports {output_spikes[47]}]
set_load -pin_load 15.0 [get_ports {output_spikes[46]}]
set_load -pin_load 15.0 [get_ports {output_spikes[45]}]
set_load -pin_load 15.0 [get_ports {output_spikes[44]}]
set_load -pin_load 15.0 [get_ports {output_spikes[43]}]
set_load -pin_load 15.0 [get_ports {output_spikes[42]}]
set_load -pin_load 15.0 [get_ports {output_spikes[41]}]
set_load -pin_load 15.0 [get_ports {output_spikes[40]}]
set_load -pin_load 15.0 [get_ports {output_spikes[39]}]
set_load -pin_load 15.0 [get_ports {output_spikes[38]}]
set_load -pin_load 15.0 [get_ports {output_spikes[37]}]
set_load -pin_load 15.0 [get_ports {output_spikes[36]}]
set_load -pin_load 15.0 [get_ports {output_spikes[35]}]
set_load -pin_load 15.0 [get_ports {output_spikes[34]}]
set_load -pin_load 15.0 [get_ports {output_spikes[33]}]
set_load -pin_load 15.0 [get_ports {output_spikes[32]}]
set_load -pin_load 15.0 [get_ports {output_spikes[31]}]
set_load -pin_load 15.0 [get_ports {output_spikes[30]}]
set_load -pin_load 15.0 [get_ports {output_spikes[29]}]
set_load -pin_load 15.0 [get_ports {output_spikes[28]}]
set_load -pin_load 15.0 [get_ports {output_spikes[27]}]
set_load -pin_load 15.0 [get_ports {output_spikes[26]}]
set_load -pin_load 15.0 [get_ports {output_spikes[25]}]
set_load -pin_load 15.0 [get_ports {output_spikes[24]}]
set_load -pin_load 15.0 [get_ports {output_spikes[23]}]
set_load -pin_load 15.0 [get_ports {output_spikes[22]}]
set_load -pin_load 15.0 [get_ports {output_spikes[21]}]
set_load -pin_load 15.0 [get_ports {output_spikes[20]}]
set_load -pin_load 15.0 [get_ports {output_spikes[19]}]
set_load -pin_load 15.0 [get_ports {output_spikes[18]}]
set_load -pin_load 15.0 [get_ports {output_spikes[17]}]
set_load -pin_load 15.0 [get_ports {output_spikes[16]}]
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
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports rst]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[63]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[62]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[61]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[60]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[59]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[58]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[57]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[56]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[55]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[54]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[53]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[52]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[51]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[50]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[49]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[48]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[47]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[46]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[45]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[44]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[43]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[42]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[41]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[40]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[39]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[38]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[37]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[36]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[35]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[34]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[33]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[32]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[31]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[30]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[29]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[28]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[27]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[26]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[25]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[24]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[23]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[22]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[21]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[20]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[19]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[18]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[17]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[16]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[15]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[14]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[13]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[12]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[11]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[10]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[9]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[8]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[7]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[6]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[5]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[4]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[3]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[2]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[1]}]
set_input_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {input_spikes[0]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[63]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[62]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[61]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[60]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[59]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[58]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[57]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[56]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[55]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[54]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[53]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[52]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[51]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[50]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[49]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[48]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[47]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[46]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[45]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[44]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[43]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[42]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[41]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[40]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[39]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[38]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[37]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[36]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[35]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[34]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[33]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[32]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[31]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[30]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[29]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[28]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[27]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[26]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[25]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[24]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[23]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[22]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[21]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[20]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[19]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[18]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[17]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[16]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[15]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[14]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[13]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[12]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[11]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[10]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[9]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[8]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[7]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[6]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[5]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[4]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[3]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[2]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[1]}]
set_output_delay -clock [get_clocks aclk] -add_delay 2000.0 [get_ports {output_spikes[0]}]
set_clock_uncertainty -setup 200.0 [get_clocks aclk]
set_clock_uncertainty -hold 200.0 [get_clocks aclk]
