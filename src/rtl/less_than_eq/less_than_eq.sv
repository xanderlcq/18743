`default_nettype none

module less_than_eq
#(parameter GAMMA_CYCLE_WIDTH=16,
  parameter PULSE_WIDTH=8)
(
    input logic rst,
    input logic a,
    input logic b,
    output logic q
);
`ifdef RISING
//edge transition base, rising
  logic c, d;
  assign c = (~a) & b;
  sr_latch sr(.s(c), .r(rst), .q(d), .q_b());
  assign q = a & (~d);


`elsif FALLING
//edge transition base, falling, JES_STC_GRL_2_12_20.pdf

    logic c, d;
    assign c = ~((a) & (~b));
    sr_latch sr(.s(~c), .r(rst), .q(d), .q_b());
    assign q = q | a;
`else
//pulse width base

`endif

endmodule: less_than_eq