module tb();

    parameter GAMMA_CYCLE_WIDTH = 16;
    parameter PULSE_WIDTH = 8;
    parameter WIDTH = 8;
    logic [WIDTH-1:0] in, out;
    logic grst, aclk, rst; //aclk only for driving the tb

    logic hard_reset;

    mem_group_share #(GAMMA_CYCLE_WIDTH, PULSE_WIDTH, WIDTH) DUT(.*);

    logic [$clog2(GAMMA_CYCLE_WIDTH) - 1 : 0] counter;
    


    `ifdef RISING
        task reset();
            rst <= 1'b1;
            @(posedge aclk);
            rst <= 1'b0;
        endtask

        initial begin
            $display("Testing Rising Edge of naive delay");
            reset();
            in <= 1'b0;
            hard_reset = 1'b1;
            rst <= 1'b1;
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            hard_reset = 1'b0;
            rst <= 1'b0;
            @(posedge aclk);
            @(posedge grst);
            @(posedge aclk) in[2] <= 1'b1;
            @(posedge aclk) in[5] <= 1'b1;
            @(posedge aclk);
            @(posedge aclk) in[0] <= 1'b1;
            @(posedge aclk);
            @(posedge aclk) in[6] <= 1'b1;
            

            @(posedge grst) in <= '0;
            

            @(posedge aclk);
            // @(posedge grst);
            @(posedge aclk);
            // in <= 1'b1;
            @(posedge grst);
            // in <= 1'b0;
            rst <= 1'b1;
            @(posedge aclk);
            rst <= 1'b0;
            @(posedge grst);
            @(posedge grst);
            @(posedge aclk) in[7] <= 1'b1;
             @(posedge aclk);
            @(posedge aclk) in[3] <= 1'b1;
            @(posedge aclk);
            @(posedge aclk) in[1] <= 1'b1;
            @(posedge aclk) in[4] <= 1'b1;
            

            @(posedge grst) in <= '0;
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
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
            @(posedge aclk);
           
            

            $finish;
        end


    `endif

    initial begin
        aclk = 0;
    end

    always begin
        #5 aclk = ~aclk;
    end

    assign grst = counter == 16'd0;

    always_ff @(posedge aclk) begin
        if(hard_reset) begin
            counter <= '0;
        end else begin
            counter <= counter + 1;
        end
        // grst <= counter == 16'd0;
    end
endmodule