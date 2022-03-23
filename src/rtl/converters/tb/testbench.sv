module tb();
logic grst, gclk, aclk, edge_input, pulse_output;
edge2pulse DUT(.*);


`ifdef RISING
    initial begin
        aclk = 0;
        grst <= 1'b1;
        @(posedge aclk);
        edge_input <= 1'b0;
        @(posedge aclk);
        grst <= 1'b0;
        
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);
        edge_input <= 1'b1;
        @(posedge aclk);
        edge_input <= 1'b0;
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
        edge_input <= 1'b1;
        @(posedge aclk);
        edge_input <= 1'b0;
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);

        @(posedge aclk);
        grst <= 1'b1;
        @(posedge aclk);
        grst <= 1'b0;
        
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);
        edge_input <= 1'b1;
        @(posedge aclk);
        edge_input <= 1'b0;
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
        edge_input <= 1'b1;
        @(posedge aclk);
        edge_input <= 1'b0;
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);

        @(posedge aclk);
        grst <= 1'b1;
        @(posedge aclk);
        grst <= 1'b0;
        
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);
        edge_input <= 1'b1;
        @(posedge aclk);
        edge_input <= 1'b0;
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);
        grst <= 1'b1;
        @(posedge aclk);
        grst <= 1'b0;
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);
        $finish;
    end

    always begin
        #5 aclk = ~aclk;
    end
`endif

`ifdef FALLING
    initial begin
        aclk = 0;
        grst <= 1'b1;
        @(posedge aclk);
        edge_input <= 1'b1;
        @(posedge aclk);
        grst <= 1'b0;
        
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);
        edge_input <= 1'b0;
        @(posedge aclk);
        edge_input <= 1'b1;
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
        grst <= 1'b1;
        @(posedge aclk);
        grst <= 1'b0;
        
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);
        edge_input <= 1'b0;
        @(posedge aclk);
        edge_input <= 1'b1;
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
        edge_input <= 1'b0;
        @(posedge aclk);
        edge_input <= 1'b1;
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);

        @(posedge aclk);
        grst <= 1'b1;
        @(posedge aclk);
        grst <= 1'b0;
        
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);
        edge_input <= 1'b0;
        @(posedge aclk);
        edge_input <= 1'b1;
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);
        grst <= 1'b1;
        @(posedge aclk);
        grst <= 1'b0;
        @(posedge aclk);
        @(posedge aclk);
        @(posedge aclk);
        $finish;
    end

    always begin
        #5 aclk = ~aclk;
    end
`endif

endmodule:tb