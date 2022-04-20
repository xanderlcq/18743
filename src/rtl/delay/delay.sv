`default_nettype none

/***
* Rising Edge Implementation
* If the gamma cycle is G, we can delay by at most G-1 unit
* Gamma cycle should be a power of 2
* Assume delay remain constant during one gamma cycle
***/
module delay
#(  parameter GAMMA_CYCLE_WIDTH=16,
    parameter PULSE_WIDTH=8)
(
    input logic grst,
    input logic aclk,
    input logic in,
    output logic out,
    input logic [$clog2(GAMMA_CYCLE_WIDTH) - 1 : 0] delay
);
`ifdef RISING
    logic [$clog2(GAMMA_CYCLE_WIDTH) - 1 : 0] counter;
    always_ff @(posedge aclk, posedge grst) begin
        if(grst) begin
            counter <= '0;
        end else if(in) begin
            counter <= counter + 1;
        end
    end
    assign out = (counter >= delay) && in;
`endif 

`ifdef PULSE
    logic [$clog2(GAMMA_CYCLE_WIDTH) - 1 : 0] counter;
    logic spiked, spiked_reg;

    always_ff @(posedge aclk, posedge grst) begin
        if(grst) begin
            spiked_reg <= 1'b0;
        end else if(in) begin
            spiked_reg <= 1'b1;
        end
    end

    assign spiked = in | spiked_reg;


    always_ff @(posedge aclk, posedge grst) begin
        if(grst) begin
            counter <= '0;
        end else if(spiked) begin
            counter <= counter + 1;
        end
    end
    //no need to worry about counter overflow and wrapping around
    //since it can count to gamma cycle.
    assign out = (counter >= delay) && (counter < (delay + PULSE_WIDTH)) && spiked;
`endif
endmodule