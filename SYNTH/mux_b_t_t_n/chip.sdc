create_clock [get_ports aclk]  -period {10000.00}  -waveform {0 5000} -name aclk

set_clock_uncertainty 400  [get_clocks aclk]
set_clock_transition -fall 150 [get_clocks aclk]
set_clock_transition -rise 150 [get_clocks aclk]

set_input_delay 2000 -clock aclk [remove_from_collection [all_inputs] aclk]
set_output_delay 2000 -clock aclk  [all_outputs]
set_load 15 [all_outputs]
