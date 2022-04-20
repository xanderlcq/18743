`default_nettype none

/***
* Rising Edge Implementation
* If the gamma cycle is G, we can delay by at most G-1 unit
* Gamma cycle should be a power of 2
* Assume delay remain constant during one gamma cycle
***/
module naive_delay
#(  parameter GAMMA_CYCLE_WIDTH=16,
    parameter PULSE_WIDTH=8)
(
    input logic grst,
    input logic aclk,
    input logic in,
    output logic out,
    input logic [$clog2(GAMMA_CYCLE_WIDTH) - 1 : 0] delay
);


    logic [GAMMA_CYCLE_WIDTH - 1 : 0] delayed_in;
    assign out = delayed_in[delay];
    //signal itself
    assign delayed_in[0] = in;
    // always_ff @(posedge aclk, posedge grst) begin
    //     if(grst) begin
    //         delayed_in[0] <= 1'b0;
    //     end else begin
    //         delayed_in[0] <= in;
    //     end
    // end

    genvar i;
    generate
        for(i = 1; i < GAMMA_CYCLE_WIDTH; i++) begin
            always_ff @(posedge aclk, posedge grst) begin
                if(grst) begin
                    delayed_in[i] <= 1'b0;
                end else begin
                    delayed_in[i] <= delayed_in[i-1];
                end
            end
        end
    endgenerate

endmodule