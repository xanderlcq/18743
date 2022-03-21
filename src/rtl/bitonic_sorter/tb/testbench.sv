// Testbench for a 32-input bitonic sorter

// Input lines make 1->0 transitions at different times coming in
// at the 32 input lines in an unsorted manner. You can play around with it
// as you like.
// At the output of the sorter, the lines should have 1->0 transitions in
// ascending order.

// You DON'T need to modify this file to verify 32-bit sorter. But for testing
// sorters with other sizes, you can follow the comments below.

`timescale 1ns / 1ps

module tb;

    reg [0:31] raw_in; // Change this value to represent your input size
                       // For example, if you want to test a 4-input sorter, it should be [0:3]
    wire [0:31] sorted_out; // As above

    bitonic_sort_32 DUT (.sorted_out(sorted_out), .raw_in(raw_in)); // Change this instantiation
                                                                    // as per the sorter you wish to test

    initial
    begin

        $dumpfile("tb.vcd"); // Change this name as required
        $dumpvars(0, tb);

        // You can insert your own time values (numbers after hash) at your desired input lines
        #5;

        //// Inputs begin ////
        raw_in = 32'hffffffff;

        #5;
        #10 raw_in[12] = 1'b0;
        #5 raw_in[18] = 1'b0;
        #8 raw_in[22] = 1'b0;
        #4 raw_in[0] = 1'b0;
        #5 raw_in[3] = 1'b0;
        #5 raw_in[30] = 1'b0;
        #6 raw_in[20] = 1'b0;
        #6 raw_in[26] = 1'b0;
        #6 raw_in[2] = 1'b0;
        #1 raw_in[11] = 1'b0;
        #6 raw_in[5] = 1'b0;
        #10 raw_in[16] = 1'b0;
        #1 raw_in[21] = 1'b0;
        #4 raw_in[9] = 1'b0;
        #8 raw_in[10] = 1'b0;
        #0 raw_in[7] = 1'b0;
        #5 raw_in[15] = 1'b0;
        #9 raw_in[17] = 1'b0;
        #7 raw_in[24] = 1'b0;
        #1 raw_in[27] = 1'b0;
        #8 raw_in[29] = 1'b0;
        #5 raw_in[19] = 1'b0;
        #9 raw_in[31] = 1'b0;
        #6 raw_in[6] = 1'b0;
        #9 raw_in[1] = 1'b0;
        #7 raw_in[13] = 1'b0;
        #10 raw_in[14] = 1'b0;
        #8 raw_in[4] = 1'b0;
        #4 raw_in[25] = 1'b0;
        #4 raw_in[23] = 1'b0;
        #7 raw_in[28] = 1'b0;
        #6 raw_in[8] = 1'b0;

        
        //// Inputs end ////



        #200
        $finish;

    end

endmodule
