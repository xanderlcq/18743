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

    `ifdef RISING
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

    initial begin
        aclk = 0;
    end

    always begin
        #5 aclk = ~aclk;
    end
endmodule