`default_nettype none

module tb();

`ifdef RISING
// rising edge transition base
    logic set, a, b, y;
    not_equal DUT(.*);

`elsif FALLING
// falling edge transition base
    logic set, a, b, y;
    not_equal DUT(.*);

`else
// pulse width base

`endif

endmodule