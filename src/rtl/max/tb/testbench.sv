`default_nettype none

module tb();

`ifdef RISING
// rising edge transition base
    logic a, b, y;
    max DUT(.a(a), .b(b), .y(y));

`elsif FALLING
// falling edge transition base
    logic a, b, y;
    max DUT(.a(a), .b(b), .y(y));

`else
// pulse width base
    logic aclk, grst, a, b, y;
    max DUT(.*);

`endif

endmodule