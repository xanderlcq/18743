module wta_1
#(  parameter GAMMA_CYCLE_WIDTH=16,
    parameter PULSE_WIDTH=8,
    parameter NUM_INPUTS = 16)
(
    input logic rst,
    input logic [NUM_INPUTS-1:0] input_spikes,
    output logic [NUM_INPUTS-1:0] output_spikes
);

`ifdef FALLING
    
    logic [NUM_INPUTS-1:0] lteq_outputs, lteq_outputs_b;
    logic inhibit, spiked;

    assign lteq_outputs_b = ~lteq_outputs;
    assign spiked = & lteq_outputs;

    // TODO: This is not needed if it's pure falling edge.
    sr_latch Inhibit_sr(.s(~spiked), .r(rst), .q(), .q_b(inhibit));

    
    genvar i;
    generate
        for(i = 0; i < NUM_INPUTS; i++) begin
            less_than_eq Lteq(.a(input_spikes[i]), .b(inhibit), .rst(rst), .q(lteq_outputs[i]));
            if(i > 0) begin
                logic blocker;
                assign blocker = |(lteq_outputs_b[i-1:0]);
                assign output_spikes[i] = lteq_outputs[i] | blocker;
            end else begin
                assign output_spikes[0] = lteq_outputs[0];
            end
        end
    endgenerate

`else //rising == pulse base
    logic [NUM_INPUTS-1:0] lteq_outputs, lteq_outputs_b;
    logic inhibit, spiked;

    assign lteq_outputs_b = ~lteq_outputs;
    assign spiked = | lteq_outputs;
    sr_latch Inhibit_sr(.s(spiked), .r(rst), .q(inhibit), .q_b());
    genvar i;
    generate
        for(i = 0; i < NUM_INPUTS; i++) begin
            less_than_eq Lteq(.a(input_spikes[i]), .b(inhibit), .rst(rst), .q(lteq_outputs[i]));
            if(i > 0) begin
                logic blocker;
                assign blocker = &(lteq_outputs_b[i-1:0]);
                assign output_spikes[i] = lteq_outputs[i] & blocker;
            end else begin
                assign output_spikes[0] = lteq_outputs[0];
            end
        end
    endgenerate
`endif


endmodule: wta_1