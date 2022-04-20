module tb();

    parameter GAMMA_CYCLE_WIDTH = 16;
    parameter PULSE_WIDTH = 4;

    logic in, out;
    logic [$clog2(GAMMA_CYCLE_WIDTH) - 1 : 0] delay;
    logic grst, aclk; //aclk only for driving the tb

    delay #(GAMMA_CYCLE_WIDTH, PULSE_WIDTH) DUT(.*);



    `ifdef PULSE
        task reset();
            grst <= 1;
            in = '0;
            delay = '0;
            @(posedge aclk);
            grst <= 0;

        endtask

        initial begin
            $display("Testing Rising Edge of naive delay");
            reset();
            in <= 1'b1;
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            in <= 1'b0;
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);

            reset();
            in <= 1'b1;
            delay <= 4'd2;
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            in <= 1'b0;
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);

            reset();
            in <= 1'b1;
            delay <= 4'd5;
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            in <= 1'b0;
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);

            reset();
            delay <= 4'd6;
            @(posedge aclk);
            @(posedge aclk);
            in <= 1'b1;
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            in <= 1'b0;
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);


            reset();
            delay <= 4'd12;
            in <= 1'b1;
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            in <= 1'b0;
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            reset();

           
            

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