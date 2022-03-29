module kwta
#(  parameter GAMMA_CYCLE_WIDTH=16,
    parameter PULSE_WIDTH=8,
    parameter NUM_INPUTS = 16,
    parameter K = 4)
(
    input logic rst,
    input logic [NUM_INPUTS-1:0] input_spikes,
    output logic [NUM_INPUTS-1:0] output_spikes
);

`ifdef FALLING

`else //rising == pulse base
    logic [NUM_INPUTS-1:0] lteq_outputs, lteq_outputs_b;
    logic inhibit, spiked;
    logic [$clog2(NUM_INPUTS)-1:0] counter;

    assign lteq_outputs_b = ~lteq_outputs;
    assign spiked = counter >= K;

    always_comb begin
        counter = '0;
        for(int i = 0; i < NUM_INPUTS; i++) begin
            if(lteq_outputs[i]) begin
                counter += 1;
            end
        end
    end

    `ifdef RISING
        assign inhibit = spiked;
    `else
        //pulse case
        sr_latch Inhibit_sr(.s(spiked), .r(rst), .q(inhibit), .q_b());
    `endif

    assign output_spikes = lteq_outputs;
    genvar i;
    generate
        for(i = 0; i < NUM_INPUTS; i++) begin
            less_than_eq Lteq(.a(input_spikes[i]), .b(inhibit), .rst(rst), .q(lteq_outputs[i]));
        end
    endgenerate
`endif


endmodule: kwta