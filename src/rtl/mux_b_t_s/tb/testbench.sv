`default_nettype none

module tb();

`ifdef RISING
// rising edge transition base

    parameter GAMMA_CYCLE_WIDTH = 16;
    parameter PULSE_WIDTH = 8;
    parameter NUM_INPUTS = 16;
    parameter BUS_WIDTH = 8;

    logic aclk, grst;
    logic [NUM_INPUTS-1:0] [BUS_WIDTH-1:0] inputs;
    logic select_line;
    logic [BUS_WIDTH-1:0] y;

    int delay;

    mux_b_t_s dut(.aclk(aclk), .grst(grst), .inputs(inputs), .select_line(select_line), .y(y));

    task reset();
        grst = 1'b1;
        inputs = 'd0;
        select_line = 1'b0;
        
        repeat (2) @(posedge aclk);
        grst = 1'b0;
    endtask

    initial begin
        reset();

        delay = 10;
        inputs[9] = 'd9;
        inputs[10] = 'd10;
        inputs[11] = 'd11;
        repeat (delay) @(posedge aclk);
        select_line = 1'b1;
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