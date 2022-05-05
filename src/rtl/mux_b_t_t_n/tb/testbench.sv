`default_nettype none

module tb();

`ifdef RISING
// rising edge transition base
    parameter GAMMA_CYCLE_WIDTH=16;
    parameter PULSE_WIDTH=8;
    parameter NUM_INPUTS=8;
    parameter INPUT_WIDTH = $clog2(GAMMA_CYCLE_WIDTH);

    logic grst, aclk;
    logic [NUM_INPUTS-1:0][INPUT_WIDTH-1:0] inputs, out;
    logic select;

    mux_b_t_t_n #(GAMMA_CYCLE_WIDTH, PULSE_WIDTH, NUM_INPUTS, INPUT_WIDTH) DUT(.*);
    
    task reset();
       grst <= 1'b1;
       select <= '0;
       @(posedge aclk);
       grst <= 1'b0;
    endtask

    initial begin
        inputs[0] = 3;
        inputs[1] = 0;
        inputs[2] = 0;
        inputs[3] = 7;
        inputs[4] = 12;
        inputs[5] = 1;
        inputs[6] = 0;
        inputs[7] = 3;
        reset();
        //select 7
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);
        select <= 1'b1;
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);

        reset();
        //select 3, two lines
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);
        select <= 1'b1;
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);


        reset();
        //select nothing
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);
        select <= 1'b1;
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);




        $finish;
    end

    initial begin
        aclk = 1'b0;
    end

    always #5 aclk = ~aclk;
`endif

endmodule