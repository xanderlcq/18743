`default_nettype none

module tb();

`ifdef RISING
// rising edge transition base

    parameter GAMMA_CYCLE_WIDTH = 16;
    parameter PULSE_WIDTH = 8;
    parameter NUM_INPUTS = GAMMA_CYCLE_WIDTH;

    logic aclk, grst;
    logic [NUM_INPUTS-1:0] inputs;
    logic sel_greater, sel_lesser;
    logic [NUM_INPUTS-1:0] y;

    int delay;

    filter dut(.aclk(aclk), .grst(grst), .inputs(inputs), .sel_greater(sel_greater), .sel_lesser(sel_lesser), .y(y));

    task reset();
        grst = 1'b1;
        inputs = 'd0;
        sel_greater = 1'b0;
        sel_lesser = 1'b0;
        
        repeat (2) @(posedge aclk);
        grst = 1'b0;
    endtask

    initial begin
        reset();

        delay = 0;
        inputs[10] = 1'b1;
        repeat (1) @(posedge aclk); delay ++;
        inputs[1] = 1'b1;
        repeat (1) @(posedge aclk); delay ++;
        sel_greater = 1'b1;
        inputs[6] = 1'b1;
        repeat (1) @(posedge aclk); delay ++;
        inputs[8] = 1'b1;
        repeat (1) @(posedge aclk); delay ++;
        inputs[2] = 1'b1;
        repeat (1) @(posedge aclk); delay ++;
        inputs[4] = 1'b1;
        sel_lesser = 1'b1;
        repeat (1) @(posedge aclk); delay ++;
        inputs[15] = 1'b1;
        repeat (GAMMA_CYCLE_WIDTH - delay) @(posedge aclk);

        reset();
        repeat (GAMMA_CYCLE_WIDTH) @(posedge aclk);

        $finish;
    end

    initial begin
        aclk = 0;
    end

    always begin
        #5 aclk = ~aclk;
    end

`elsif FALLING
// falling edge transition base

`else
// pulse width base

`endif

endmodule