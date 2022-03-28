`default_nettype none

module tb();

`ifdef RISING
// rising edge transition base
    logic rst, a, b, y;
    equal DUT(.rst(rst), .a(a), .b(b), .y(y));

`elsif FALLING
// falling edge transition base
    logic rst, a, b, y;
    equal DUT(.rst(rst), .a(a), .b(b), .y(y));

`else
// pulse width base
    logic aclk, grst, rst, a, b, y;
    equal DUT(.*);

`endif

endmodule