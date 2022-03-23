`default_nettype none

module not_equal
#(parameter GAMMA_CYCLE_WIDTH=16,
  parameter PULSE_WIDTH=8)
(
	input logic set,
    input logic a,
    input logic b,
    output logic y
);
`ifdef RISING
// rising edge transition base
    logic c, d, e;
    assign c = ((~a) ^ (~b));
	sr_latch sr(.s(set), .r(c), .q(d), .q_b());
	assign e = ((~c) & d);
    assign y = ~((~a) | e);

`elsif FALLING
// falling edge transition base (JES_STC_GRL_2_12_20.pdf)
    logic c, d, e;
    assign c = (a ^ b);
	sr_latch sr(.s(set), .r(c), .q(d), .q_b());
	assign e = ((~c) & d);
    assign y = (a | e);

`else
// pulse width base

`endif

endmodule: not_equal