module tb();

    parameter NUM_INPUTS = 8;
    parameter GAMMA_CYCLE_WIDTH = 16;
    parameter PULSE_WIDTH = 8;
    parameter K = 3;
    logic [NUM_INPUTS-1:0] input_spikes, output_spikes;
    logic grst, aclk; //aclk only for driving the tb

    kwta #(GAMMA_CYCLE_WIDTH, PULSE_WIDTH, NUM_INPUTS, K) DUT(.*);



    `ifdef RISING
        task reset();
            grst <= 1;
            input_spikes = '0;
            @(posedge aclk);
            grst <= 0;
            @(posedge aclk);
            @(posedge aclk);
            
            @(posedge aclk);
            @(posedge aclk);
        endtask

        initial begin
            $display("Testing Rising Edge of wta1");
            reset();
            input_spikes[0] <= 1'b1;
            @(posedge aclk);
            @(posedge aclk);

            reset();
            @(posedge aclk);
            input_spikes[3] <= 1'b1;
            @(posedge aclk);
            input_spikes[7] <= 1'b1;
            @(posedge aclk);
            input_spikes[6] <= 1'b1;
            @(posedge aclk);
            input_spikes[2] <= 1'b1;
            @(posedge aclk);
            input_spikes[0] <= 1'b1;
            @(posedge aclk);

            reset();
            @(posedge aclk);
            input_spikes[1] <= 1'b1;
            input_spikes[4] <= 1'b1;
            input_spikes[5] <= 1'b1;
            @(posedge aclk);
            input_spikes[6] <= 1'b1;
            @(posedge aclk);
            @(posedge aclk);
            input_spikes[2] <= 1'b1;
            @(posedge aclk);
            @(posedge aclk);


            reset();
            @(posedge aclk);
            input_spikes[5] <= 1'b1;
            @(posedge aclk);
            input_spikes[6] <= 1'b1;
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            // input_spikes[2] <= 1'b1;
            @(posedge aclk);
            @(posedge aclk);

            //this is to demonstrate the tie breaking does not work
            reset();
            @(posedge aclk);
            input_spikes[5] <= 1'b1;
            @(posedge aclk);
            input_spikes[6] <= 1'b1;
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            input_spikes[2] <= 1'b1;
            input_spikes[4] <= 1'b1;
            @(posedge aclk);
            @(posedge aclk);
            reset();
            @(posedge aclk);
            @(posedge aclk);
            input_spikes[7] <= 1'b1;
            input_spikes[6] <= 1'b1;
            input_spikes[5] <= 1'b1;
            input_spikes[4] <= 1'b1;
            input_spikes[3] <= 1'b1;
            input_spikes[2] <= 1'b1;
            input_spikes[1] <= 1'b1;
            input_spikes[0] <= 1'b1;
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            

            $finish;
        end


    `endif

    `ifdef FALLING
        // task reset();
        //     grst = 1;
        //     input_spikes = '1;
        //     @(posedge aclk);
        //     @(posedge aclk);
        //     @(posedge aclk);
        //     grst = 0;
        //     @(posedge aclk);
        //     @(posedge aclk);
        // endtask

        // initial begin
        //     $display("Testing Falling Edge of wta1");
        //     reset();
        //     input_spikes[0] <= 1'b0;
        //     @(posedge aclk);
        //     @(posedge aclk);

        //     reset();
        //     @(posedge aclk);
        //     input_spikes[3] <= 1'b0;
        //     @(posedge aclk);
        //     input_spikes[7] <= 1'b0;
        //     @(posedge aclk);
        //     input_spikes[6] <= 1'b0;
        //     @(posedge aclk);
        //     @(posedge aclk);
        //     input_spikes[2] <= 1'b0;
        //     @(posedge aclk);
        //     @(posedge aclk);

        //     reset();
        //     @(posedge aclk);
        //     input_spikes[1] <= 1'b0;
        //     input_spikes[4] <= 1'b0;
        //     input_spikes[5] <= 1'b0;
        //     @(posedge aclk);
        //     input_spikes[6] <= 1'b0;
        //     @(posedge aclk);
        //     @(posedge aclk);
        //     input_spikes[2] <= 1'b0;
        //     @(posedge aclk);
        //     @(posedge aclk);
        //     $finish;
        // end


    `endif

    initial begin
        aclk = 0;
    end

    always begin
        #5 aclk = ~aclk;
    end
endmodule