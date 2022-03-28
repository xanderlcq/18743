`default_nettype none

module tb();

`ifdef RISING
// rising edge transition base
    logic set, a, b, y;
    not_equal DUT(.set(set), .a(a), .b(b), .y(y));

`elsif FALLING
// falling edge transition base
    logic set, a, b, y;
    not_equal DUT(.set(set), .a(a), .b(b), .y(y));

`else
// pulse width base
    logic aclk, grst, set, a, b, y;
    not_equal DUT(.*);

`endif

endmodule