module wrapper
#(  parameter GAMMA_CYCLE_WIDTH=16,
    parameter PULSE_WIDTH=8,
    parameter NUM_INPUTS = 16)
(input logic aclk,
 input logic rst,
 input logic [NUM_INPUTS-1:0] input_spikes,
 output logic [NUM_INPUTS-1:0] output_spikes
);
    logic [NUM_INPUTS-1:0] dummy;

    always_ff @(posedge aclk, posedge rst) begin
        if(rst) begin
            dummy <= input_spikes;
        end else begin
            dummy <= output_spikes;
        end
    end

    wta_1 #(GAMMA_CYCLE_WIDTH, PULSE_WIDTH, NUM_INPUTS) DUT(.input_spikes(dummy), .*);

endmodule
