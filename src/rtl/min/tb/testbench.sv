`default_nettype none

module tb();

`ifdef RISING
// rising edge transition base
    logic a, b, y;
    min DUT(.a(a), .b(b), .y(y));

`elsif FALLING
// falling edge transition base
    logic a, b, y;
    min DUT(.a(a), .b(b), .y(y));

`else
// pulse width base
    logic aclk, grst, a, b, y;
    min DUT(.*);

`endif

endmodule