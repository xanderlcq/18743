`default_nettype none

module tb();

`ifdef RISING
// rising edge transition base
    logic rst, a, b, y;
    equal DUT(.*);

`elsif FALLING
// falling edge transition base
    logic rst, a, b, y;
    equal DUT(.*);

`else
// pulse width base

`endif

endmodule