`default_nettype none

module tb();

`ifdef RISING
// rising edge transition base
    logic rst, a, b, q;
    greater_than_eq DUT(.rst(rst), .a(a), .b(b), .q(q));

`elsif FALLING
// falling edge transition base
    logic rst, a, b, q;
    greater_than_eq DUT(.rst(rst), .a(a), .b(b), .q(q));

`else
// pulse width base
    logic rst, grst, aclk, a, b, q;
    greater_than_eq DUT(.*);

`endif

endmodule