`default_nettype none

module tb();

`ifdef RISING
// rising edge transition base

`elsif FALLING
// falling edge transition base
    logic a, b, y;
    min DUT(.*);

`else
// pulse width base

`endif

endmodule