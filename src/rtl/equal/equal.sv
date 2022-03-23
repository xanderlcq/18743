`default_nettype none

module equal
#(parameter GAMMA_CYCLE_WIDTH=16,
  parameter PULSE_WIDTH=8)
(
	input logic rst,
    input logic a,
    input logic b,
    output logic y
);
`ifdef RISING
// rising edge transition base
    logic c, d;
    assign c = ((~a) ^ (~b));
	sr_latch sr(.s(c), .r(rst), .q(d), .q_b());
	assign y = ~((~a) | c | d);

`elsif FALLING
// falling edge transition base (JES_STC_GRL_2_12_20.pdf)
    logic c, d;
    assign c = (a ^ b);
	sr_latch sr(.s(c), .r(rst), .q(d), .q_b());
	assign y = (a | c | d);

`else
// pulse width base

`endif

endmodule: equal