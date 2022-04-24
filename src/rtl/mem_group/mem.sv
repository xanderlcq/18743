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
    input logic rst //must be asserted every time to start function correctly
);

`ifdef RISING
    logic spiked, spiked_next;
    logic [$clog2(GAMMA_CYCLE_WIDTH) - 1 : 0] counter, counter_next;

    // always_comb begin
    //     if(spiked) begin
    //         spiked_next = 1'b1;
    //     end else if(in) begin
    //         spiked_next = 1'b1;
    //     end else begin
    //         spiked_next = 1'b0;
    //     end
    // end
    assign spiked_next = spiked | in;

    always_ff @(posedge aclk, posedge rst) begin
        if(rst) begin
            spiked <= '0;
        end else begin
            spiked <= spiked_next;
        end
    end

    assign counter_next = (spiked_next) ? counter + 1 : counter;

    always_ff @(posedge aclk, posedge rst) begin
        if(rst) begin
            counter <= '0;
        end else begin
            counter <= counter_next;
        end
    end

    // 0 1 2 3 4 5 6 7 | 
    // 0 0 0 ^0 1 2 3 4 | 5 6 7 ^0 1 2 3 4 | 
    logic should_spike, should_spike_next;
    assign should_spike_next = (counter_next == 1) | should_spike;

    assign out = should_spike_next & spiked_next;

    always_ff @(posedge aclk, posedge grst) begin
        if(grst) begin
            should_spike <= '0;
        end else begin 
            should_spike <= should_spike_next; 
        end
    end

`endif 

endmodule