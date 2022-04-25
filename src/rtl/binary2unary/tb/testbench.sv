`default_nettype none

module tb();

`ifdef RISING
// rising edge transition base

    parameter GAMMA_CYCLE_WIDTH = 16;
    parameter PULSE_WIDTH = 8;
    parameter INPUT_WIDTH = $clog2(GAMMA_CYCLE_WIDTH);

    logic aclk, grst;
    logic [INPUT_WIDTH-1:0] binary_input;
    logic unary_output;

    binary2unary dut(.grst(grst), .aclk(aclk), .binary_input(binary_input), .unary_output(unary_output));

    task reset();
        grst = 1'b1;
        binary_input = 'd0;
        
        repeat (2) @(posedge aclk);
        grst = 1'b0;
    endtask

    initial begin
        reset();
        binary_input = 'd1;
        repeat (GAMMA_CYCLE_WIDTH) @(posedge aclk);

        reset();
        binary_input = 'd8;
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

    parameter GAMMA_CYCLE_WIDTH = 16;
    parameter PULSE_WIDTH = 8;
    parameter INPUT_WIDTH = $clog2(GAMMA_CYCLE_WIDTH);

    logic aclk, grst;
    logic [INPUT_WIDTH-1:0] binary_input;
    logic unary_output;

    binary2unary dut(.grst(grst), .aclk(aclk), .binary_input(binary_input), .unary_output(unary_output));

    task reset();
        grst = 1'b1;
        binary_input = 'd0;
        
        repeat (2) @(posedge aclk);
        grst = 1'b0;
    endtask

    initial begin
        reset();
        binary_input = 'd1;
        repeat (GAMMA_CYCLE_WIDTH) @(posedge aclk);

        reset();
        binary_input = 'd8;
        repeat (GAMMA_CYCLE_WIDTH) @(posedge aclk);

        $finish;
    end

    initial begin
        aclk = 0;
    end

    always begin
        #5 aclk = ~aclk;
    end


`else
// pulse width base

    parameter GAMMA_CYCLE_WIDTH = 16;
    parameter PULSE_WIDTH = 8;
    parameter INPUT_WIDTH = $clog2(GAMMA_CYCLE_WIDTH);

    logic aclk, grst;
    logic [INPUT_WIDTH-1:0] binary_input;
    logic unary_output;

    binary2unary dut(.grst(grst), .aclk(aclk), .binary_input(binary_input), .unary_output(unary_output));

    task reset();
        grst = 1'b1;
        binary_input = 'd0;
        
        repeat (2) @(posedge aclk);
        grst = 1'b0;
    endtask

    initial begin
        reset();
        binary_input = 'd1;
        repeat (GAMMA_CYCLE_WIDTH) @(posedge aclk);

        reset();
        binary_input = 'd8;
        repeat (GAMMA_CYCLE_WIDTH) @(posedge aclk);

        $finish;
    end

    initial begin
        aclk = 0;
    end

    always begin
        #5 aclk = ~aclk;
    end


`endif

endmodule