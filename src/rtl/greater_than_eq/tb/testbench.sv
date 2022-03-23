`default_nettype none

module tb();

`ifdef RISING
// rising edge transition base
    logic rst, a, b, q;
    greater_than_eq DUT(.*);

`elsif FALLING
// falling edge transition base
    logic rst, a, b, q;
    greater_than_eq DUT(.*);

`else
// pulse width base

`endif

endmodule