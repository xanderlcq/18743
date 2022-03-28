`default_nettype none
module tb();


`ifdef RISING
//edge transition base, rising

    logic rst, a, b, q;
    less_than_eq DUT(.rst(rst), .a(a), .b(b), .q(q));

`elsif FALLING
//edge transition base, falling

    logic rst, a, b, q;
    less_than_eq DUT(.rst(rst), .a(a), .b(b), .q(q));

`else
//pulse width 

    logic rst, grst, aclk, a, b, q;
    less_than_eq DUT(.*);

`endif


endmodule