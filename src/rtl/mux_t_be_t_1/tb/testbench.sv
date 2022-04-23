`default_nettype none

module tb();

`ifdef RISING
// rising edge transition base
    parameter GAMMA_CYCLE_WIDTH=16;
    parameter PULSE_WIDTH=8;
    parameter NUM_INPUTS=GAMMA_CYCLE_WIDTH;
    parameter SELECT_WIDTH=$clog2(GAMMA_CYCLE_WIDTH);

    logic grst, aclk;
    logic [NUM_INPUTS-1:0] inputs;
    logic y;
    logic [SELECT_WIDTH-1:0] select_line;

    mux_t_be_t_1 DUT(.grst(grst), .aclk(aclk), .inputs(inputs), .select(select_line), .out(y));
    
    task reset();
       grst = 1'b1;
       inputs = 'b0;
       repeat (2) @(posedge aclk);
       grst = 1'b0;
    endtask

    initial begin
        reset();

        // Scenario 1
        select_line = 'd2;
        repeat (2) @(posedge aclk);
        inputs[0] = ~inputs[0];
        repeat (2) @(posedge aclk);
        inputs[1] = ~inputs[1];
        repeat (2) @(posedge aclk);
        inputs[2] = ~inputs[2];
        repeat (GAMMA_CYCLE_WIDTH - 6) @(posedge aclk);
        reset();
        
        // Scenario 2
        select_line = 'd4;
        repeat (2) @(posedge aclk);
        inputs[0] = ~inputs[0];
        repeat (2) @(posedge aclk);
        inputs[3] = ~inputs[3];
        repeat (2) @(posedge aclk);
        inputs[2] = ~inputs[2];
        repeat (GAMMA_CYCLE_WIDTH - 6) @(posedge aclk);
        reset();
        
        // Scenario 3
        select_line = 'd6;
        repeat (2) @(posedge aclk);
        inputs[3] = ~inputs[3];
        repeat (2) @(posedge aclk);
        inputs[2] = ~inputs[2];
        repeat (GAMMA_CYCLE_WIDTH - 4) @(posedge aclk);
        reset();

        #40; $finish;
    end

    initial begin
        aclk = 1'b0;
    end

    always #5 aclk = ~aclk;

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