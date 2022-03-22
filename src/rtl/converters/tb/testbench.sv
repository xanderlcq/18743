module tb();
logic rst, gclk, aclk, edge_input, pulse_output;
edge2pulse DUT(.*);


`ifdef RISING
    initial begin
        aclk = 0;
        rst <= 1'b1;
        edge_input <= 1'b0;
        @(posedge aclk);
        @(posedge aclk);
        rst <= 1'b0;


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
        $finish;
    end

    always begin
        #5 aclk = ~aclk;
    end
`endif


endmodule:tb