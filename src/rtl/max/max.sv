`default_nettype none

module max
#(parameter GAMMA_CYCLE_WIDTH=16,
  parameter PULSE_WIDTH=8)
(
    input logic a,
    input logic b,
    output logic y
);
`ifdef RISING
// rising edge transition base
    assign y = (a & b);

`elsif FALLING
// falling edge transition base (JES_STC_GRL_2_12_20.pdf)
    assign y = (a | b);

`else
// pulse width base

`endif

endmodule: max