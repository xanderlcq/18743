`default_nettype none

module mux
#(parameter NUM_INPUTS=4,
  parameter GAMMA_CYCLE_WIDTH=16,
  parameter PULSE_WIDTH=8)
(
    input logic inputs[NUM_INPUTS],
    input logic select_line,
    output logic y
);
`ifdef RISING
// rising edge transition base

`elsif FALLING
// falling edge transition base

`else
// pulse width base


`endif

endmodule: mux