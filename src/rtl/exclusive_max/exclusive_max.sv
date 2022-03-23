`default_nettype none

module less_than
#(parameter GAMMA_CYCLE_WIDTH=16,
  parameter PULSE_WIDTH=8)
(
    input logic set,
    input logic a,
    input logic b,
    output logic q
);
`ifdef RISING
//edge transition base, rising

    logic c, d, e, f, g, h;
    assign c = ((~a) & (b));
    assign d = ((a) & (~b));
    assign e = ((~c) & (~d));
    assign f = ((~a) | (~b));

    sr_latch sr(.s(set), .r(~e), .q(g), .q_b());

    assign h = g & e;
    assign q = ~(h | f);


`elsif FALLING
//edge transition base, falling, JES_STC_GRL_2_12_20.pdf

    logic c, d, e, f, g, h;
    assign c = ((a) & (~b));
    assign d = ((~a) & (b));
    assign e = ((~c) & (~d));
    assign f = a | b;

    sr_latch sr(.s(set), .r(~e), .q(g), .q_b());

    assign h = g & e;
    assign q = h | f;
`else
//pulse width base

`endif

endmodule: less_than