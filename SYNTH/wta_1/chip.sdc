set period 50000.0
set uncertain 200
#[expr {$period * 0.1}]
set delay 2000 
#[expr {$period * 0.2}]

create_clock [get_ports aclk]  -period $period -name aclk

set_clock_uncertainty $uncertain  [get_clocks aclk]
set_clock_transition -fall 150 [get_clocks aclk]
set_clock_transition -rise 150 [get_clocks aclk]

set_input_delay $delay -clock aclk [remove_from_collection [all_inputs] aclk]
set_output_delay $delay -clock aclk  [all_outputs]
set_load 15 [all_outputs]
