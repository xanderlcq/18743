`default_nettype none

module tb();

`ifdef RISING
// rising edge transition base

`elsif FALLING
// falling edge transition base

`else
// pulse width base
    parameter GAMMA_CYCLE_WIDTH = 16;
    parameter PULSE_WIDTH = 8;

    logic aclk;

    initial begin
        aclk = 0;
    end

    always begin
        #5 aclk = ~aclk;
    end

`endif

endmodule