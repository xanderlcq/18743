`default_nettype none

/***
* Rising Edge Implementation
* If the gamma cycle is G, we can delay by at most G-1 unit
* Gamma cycle should be a power of 2
* Assume delay remain constant during one gamma cycle
***/
module mem_group
#(  parameter GAMMA_CYCLE_WIDTH=16,
    parameter PULSE_WIDTH=8,
    parameter WIDTH=8)
(
    input logic grst, //this is used to signal the start of a new gamma cycle, must be assert during first reset
    input logic aclk,
    input logic [WIDTH - 1 : 0] in,
    output logic [WIDTH - 1 : 0] out,
    input logic rst //must be asserted every time to start function correctly
);

    genvar i;
    generate
        for(i = 0; i < WIDTH; i++) begin
            mem #(GAMMA_CYCLE_WIDTH, PULSE_WIDTH) unit(.in(in[i]), .out(out[i]), .*);
        end
    endgenerate

endmodule