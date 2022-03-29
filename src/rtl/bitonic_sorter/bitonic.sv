// Assumes 1->0 transitions as events or spikes
// Values are encoded as spiketimes
// Weights are thermometer-coded. For e.g., 11111000 represnts a weight of 3, 11000000 represents 6 and so on
// Models an edge temporal (GRL) neuron with step-no-leak response function

// Instructions -
// 1. Do not change the paths of the source codes.
// 2. Start bottom-top. Scroll to the bottom, start with bitonic_sort_2 module.
// 3. One possible approach - add modules for 4-input, 8-input and 16-input bitonic sorters (you can do so by copying the skeleton of 32-input bitonic sorter).
//    Then, complete the 32-bit implementation.
// 4. You can hierarchically verify your bitonic sorter running the 32-input bitonic_sort_tb file, either by adding debug statements in the tb file, or opening the 
//    simulation waveform window. Commands for running simulation is provided in the Makefile.

`timescale 1ns / 1ps

module bitonic_sort_32 (sorted_out, raw_in); 

    parameter N = 5;
    parameter INPUT_SIZE = 1<<N;
    genvar i, j, k, r, b, s;

    input [0:INPUT_SIZE-1] raw_in;
    output [0:INPUT_SIZE-1] sorted_out;


    /* Declare any intermediate wires you use */
    
    // logic [0:INPUT_SIZE-1] step1;
    //N+1 layers
    logic [0:N][0:INPUT_SIZE-1] cur_step;
    logic [0:INPUT_SIZE/2-1] og_order;
    assign sorted_out = cur_step[N];

    // genvar r;
    generate
        for(r = 0; r < INPUT_SIZE/2; r = r + 1) begin
            assign cur_step[0][r+INPUT_SIZE/2] = og_order[INPUT_SIZE/2 - r - 1];
        end
    endgenerate

    /* Instantiate two 2-input sorters here  */
    bitonic_sort_16 Upper(.raw_in(raw_in[0:INPUT_SIZE/2-1]), .sorted_out(cur_step[0][0:INPUT_SIZE/2-1]));
    bitonic_sort_16 Lower(.raw_in(raw_in[INPUT_SIZE/2:INPUT_SIZE-1]), .sorted_out(og_order));


    /* WRITE YOUR CODE FOR THE LAST STAGE */
    // genvar i, b, s, s_end;
    generate 
        
        for(i = 0; i < N; i = i + 1) begin : outter_loop
            //i is input layer index, i+1 is the output layer index
            for(b = 0; b < (1 << i); b = b + 1) begin: inner_loop
                //b in the block number
                for(s = b * (1 << (N-i)); s < b * (1 << (N-i)) + (1 << (N-i-1)); s = s + 1) begin: s_loop
                
                    bitonic_sort_2 swapper(.raw_in({cur_step[i][s], cur_step[i][(s+(1 << (N-i-1)))]}), .sorted_out({cur_step[i+1][s], cur_step[i+1][(s+(1 << (N-i-1)))]}));
                end
            end
        end
    endgenerate


endmodule


module bitonic_sort_16 (sorted_out, raw_in); 

    parameter N = 4;
    parameter INPUT_SIZE = 1<<N;
    genvar i, j, k, r, b, s;

    input [0:INPUT_SIZE-1] raw_in;
    output [0:INPUT_SIZE-1] sorted_out;

    /* Declare any intermediate wires you use */
    
    // logic [0:INPUT_SIZE-1] step1;
    //N+1 layers
    logic [0:N][0:INPUT_SIZE-1] cur_step;
    logic [0:INPUT_SIZE/2-1] og_order;
    assign sorted_out = cur_step[N];

    // genvar r;
    generate
        for(r = 0; r < INPUT_SIZE/2; r = r + 1) begin
            assign cur_step[0][r+INPUT_SIZE/2] = og_order[INPUT_SIZE/2 - r - 1];
        end
    endgenerate

    /* Instantiate two 2-input sorters here  */
    bitonic_sort_8 Upper(.raw_in(raw_in[0:INPUT_SIZE/2-1]), .sorted_out(cur_step[0][0:INPUT_SIZE/2-1]));
    bitonic_sort_8 Lower(.raw_in(raw_in[INPUT_SIZE/2:INPUT_SIZE-1]), .sorted_out(og_order));


    /* WRITE YOUR CODE FOR THE LAST STAGE */
    // genvar i, b, s, s_end;
    generate 
        
        for(i = 0; i < N; i = i + 1) begin : outter_loop
            //i is input layer index, i+1 is the output layer index
            for(b = 0; b < (1 << i); b = b + 1) begin: inner_loop
                //b in the block number
                for(s = b * (1 << (N-i)); s < b * (1 << (N-i)) + (1 << (N-i-1)); s = s + 1) begin: s_loop
                
                    bitonic_sort_2 swapper(.raw_in({cur_step[i][s], cur_step[i][(s+(1 << (N-i-1)))]}), .sorted_out({cur_step[i+1][s], cur_step[i+1][(s+(1 << (N-i-1)))]}));
                end
            end
        end
    endgenerate
    // Note that the output from the bottom 16-input sorter has to be sorted in descending order.
    // To enforce that, you can just reverse the indices when you take in input from the bottom 16-input sorter.
endmodule

module bitonic_sort_8 (sorted_out, raw_in); 

    parameter N = 3;
    parameter INPUT_SIZE = 1<<N;
    genvar i, j, k, r, b, s;

    input [0:INPUT_SIZE-1] raw_in;
    output [0:INPUT_SIZE-1] sorted_out;

    /* Declare any intermediate wires you use */
    
    // logic [0:INPUT_SIZE-1] step1;
    //N+1 layers
    logic [0:N][0:INPUT_SIZE-1] cur_step;
    logic [0:INPUT_SIZE/2-1] og_order;
    assign sorted_out = cur_step[N];

    // genvar r;
    generate
        for(r = 0; r < INPUT_SIZE/2; r = r + 1) begin
            assign cur_step[0][r+INPUT_SIZE/2] = og_order[INPUT_SIZE/2 - r - 1];
        end
    endgenerate

    /* Instantiate two 2-input sorters here  */
    bitonic_sort_4 Upper(.raw_in(raw_in[0:INPUT_SIZE/2-1]), .sorted_out(cur_step[0][0:INPUT_SIZE/2-1]));
    bitonic_sort_4 Lower(.raw_in(raw_in[INPUT_SIZE/2:INPUT_SIZE-1]), .sorted_out(og_order));


    /* WRITE YOUR CODE FOR THE LAST STAGE */
    // genvar i, b, s, s_end;
    generate 
        
        for(i = 0; i < N; i = i + 1) begin : outter_loop
            //i is input layer index, i+1 is the output layer index
            for(b = 0; b < (1 << i); b = b + 1) begin: inner_loop
                //b in the block number
                for(s = b * (1 << (N-i)); s < b * (1 << (N-i)) + (1 << (N-i-1)); s = s + 1) begin: s_loop
                
                    bitonic_sort_2 swapper(.raw_in({cur_step[i][s], cur_step[i][(s+(1 << (N-i-1)))]}), .sorted_out({cur_step[i+1][s], cur_step[i+1][(s+(1 << (N-i-1)))]}));
                end
            end
        end
    endgenerate
    // Note that the output from the bottom 16-input sorter has to be sorted in descending order.
    // To enforce that, you can just reverse the indices when you take in input from the bottom 16-input sorter.
endmodule

module bitonic_sort_4 (sorted_out, raw_in); 

    parameter N = 2;
    parameter INPUT_SIZE = 1<<N;
    genvar i, j, k, r, b, s;
    input [0:INPUT_SIZE-1] raw_in;
    output [0:INPUT_SIZE-1] sorted_out;

    /* Declare any intermediate wires you use */
    
    // logic [0:INPUT_SIZE-1] step1;
    //N+1 layers
    logic [0:N][0:INPUT_SIZE-1] cur_step;
    logic [0:INPUT_SIZE/2-1] og_order;
    assign sorted_out = cur_step[N];

    // genvar r;
    generate
        for(r = 0; r < INPUT_SIZE/2; r = r + 1) begin
            assign cur_step[0][r+INPUT_SIZE/2] = og_order[INPUT_SIZE/2 - r - 1];
        end
    endgenerate

    /* Instantiate two 2-input sorters here  */
    bitonic_sort_2 Upper(.raw_in(raw_in[0:INPUT_SIZE/2-1]), .sorted_out(cur_step[0][0:INPUT_SIZE/2-1]));
    bitonic_sort_2 Lower(.raw_in(raw_in[INPUT_SIZE/2:INPUT_SIZE-1]), .sorted_out(og_order));


    /* WRITE YOUR CODE FOR THE LAST STAGE */
    // genvar i, b, s, s_end;
    generate 
        
        for(i = 0; i < N; i = i + 1) begin : outter_loop
            //i is input layer index, i+1 is the output layer index
            for(b = 0; b < (1 << i); b = b + 1) begin: inner_loop
                //b in the block number
                for(s = b * (1 << (N-i)); s < b * (1 << (N-i)) + (1 << (N-i-1)); s = s + 1) begin: s_loop
                
                    bitonic_sort_2 swapper(.raw_in({cur_step[i][s], cur_step[i][(s+(1 << (N-i-1)))]}), .sorted_out({cur_step[i+1][s], cur_step[i+1][(s+(1 << (N-i-1)))]}));
                end
            end
        end
    endgenerate
    // Note that the output from the bottom 16-input sorter has to be sorted in descending order.
    // To enforce that, you can just reverse the indices when you take in input from the bottom 16-input sorter.
endmodule


module bitonic_sort_2 (sorted_out, raw_in); 

    input [0:1] raw_in;
    output [0:1] sorted_out;

    /* WRITE YOUR CODE HERE */
    //Min, first input goes low, output goes low
    assign sorted_out[0] = & raw_in;
    
    //Max, last input goes low, output goes low
    assign sorted_out[1] = | raw_in;
    /* YOUR CODE ENDS HERE */

endmodule
