module tb();

    parameter NUM_INPUTS = 8;
    parameter GAMMA_CYCLE_WIDTH = 16;
    parameter PULSE_WIDTH = 8;
    parameter K = 3;
    logic [NUM_INPUTS-1:0] input_spikes, output_spikes;
    logic rst, clk; //clk only for driving the tb

    kwta_no_tie_break #(GAMMA_CYCLE_WIDTH, PULSE_WIDTH, NUM_INPUTS, K) DUT(.*);



    `ifdef RISING
        task reset();
            rst = 1;
            input_spikes = '0;
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            rst = 0;
            @(posedge clk);
            @(posedge clk);
        endtask

        initial begin
            $display("Testing Rising Edge of wta1");
            reset();
            input_spikes[0] <= 1'b1;
            @(posedge clk);
            @(posedge clk);

            reset();
            @(posedge clk);
            input_spikes[3] <= 1'b1;
            @(posedge clk);
            input_spikes[7] <= 1'b1;
            @(posedge clk);
            input_spikes[6] <= 1'b1;
            @(posedge clk);
            @(posedge clk);
            input_spikes[2] <= 1'b1;
            @(posedge clk);
            input_spikes[0] <= 1'b1;
            @(posedge clk);

            reset();
            @(posedge clk);
            input_spikes[1] <= 1'b1;
            input_spikes[4] <= 1'b1;
            input_spikes[5] <= 1'b1;
            @(posedge clk);
            input_spikes[6] <= 1'b1;
            @(posedge clk);
            @(posedge clk);
            input_spikes[2] <= 1'b1;
            @(posedge clk);
            @(posedge clk);


            reset();
            @(posedge clk);
            input_spikes[5] <= 1'b1;
            @(posedge clk);
            input_spikes[6] <= 1'b1;
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            // input_spikes[2] <= 1'b1;
            @(posedge clk);
            @(posedge clk);

            //this is to demonstrate the tie breaking does not work
            reset();
            @(posedge clk);
            input_spikes[5] <= 1'b1;
            @(posedge clk);
            input_spikes[6] <= 1'b1;
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            input_spikes[2] <= 1'b1;
            input_spikes[4] <= 1'b1;
            @(posedge clk);
            @(posedge clk);
            $finish;
        end


    `endif

    `ifdef FALLING
        // task reset();
        //     rst = 1;
        //     input_spikes = '1;
        //     @(posedge clk);
        //     @(posedge clk);
        //     @(posedge clk);
        //     rst = 0;
        //     @(posedge clk);
        //     @(posedge clk);
        // endtask

        // initial begin
        //     $display("Testing Falling Edge of wta1");
        //     reset();
        //     input_spikes[0] <= 1'b0;
        //     @(posedge clk);
        //     @(posedge clk);

        //     reset();
        //     @(posedge clk);
        //     input_spikes[3] <= 1'b0;
        //     @(posedge clk);
        //     input_spikes[7] <= 1'b0;
        //     @(posedge clk);
        //     input_spikes[6] <= 1'b0;
        //     @(posedge clk);
        //     @(posedge clk);
        //     input_spikes[2] <= 1'b0;
        //     @(posedge clk);
        //     @(posedge clk);

        //     reset();
        //     @(posedge clk);
        //     input_spikes[1] <= 1'b0;
        //     input_spikes[4] <= 1'b0;
        //     input_spikes[5] <= 1'b0;
        //     @(posedge clk);
        //     input_spikes[6] <= 1'b0;
        //     @(posedge clk);
        //     @(posedge clk);
        //     input_spikes[2] <= 1'b0;
        //     @(posedge clk);
        //     @(posedge clk);
        //     $finish;
        // end


    `endif

    initial begin
        clk = 0;
    end

    always begin
        #5 clk = ~clk;
    end
endmodule