`default_nettype none

/***
* Rising Edge Implementation
* If the gamma cycle is G, we can delay by at most G-1 unit
* Gamma cycle should be a power of 2
* Assume delay remain constant during one gamma cycle
***/
module mem
#(  parameter GAMMA_CYCLE_WIDTH=128,
    parameter PULSE_WIDTH=8)
(
    input logic grst, //this is used to signal the start of a new gamma cycle, must be assert during first reset
    input logic aclk,
    input logic in,
    output logic out,
    input logic rst, //must be asserted every time to start function correctly
    input logic [$clog2(GAMMA_CYCLE_WIDTH) - 1 : 0] counter
);

`ifdef RISING
    logic spiked, spiked_next;
    logic [$clog2(GAMMA_CYCLE_WIDTH) - 1 : 0] memorized, memorized_next;

    assign spiked_next = spiked | in;

    always_ff @(posedge aclk, posedge rst) begin
        if(rst) begin
            spiked <= '0;
        end else begin
            spiked <= spiked_next;
        end
    end

    always_ff @(posedge aclk, posedge rst) begin
        if(rst) begin
            memorized <= '0;
        end else begin
            memorized <= memorized_next;
        end
    end

    //new spike coming in, remember it
    always_comb begin
        if(in & (~spiked)) begin
            memorized_next = counter;
        end else begin
            memorized_next = memorized;
        end
    end

    assign out = spiked_next && (counter >= memorized) && (counter != '1);
`endif 

endmodule