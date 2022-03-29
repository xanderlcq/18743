module kwta
#(  parameter GAMMA_CYCLE_WIDTH=16,
    parameter PULSE_WIDTH=8,
    parameter NUM_INPUTS = 16,
    parameter K = 4)
(
    input logic grst,
    input logic aclk,
    input logic [NUM_INPUTS-1:0] input_spikes,
    output logic [NUM_INPUTS-1:0] output_spikes
);

`ifdef FALLING

`else //rising == pulse base


    logic [NUM_INPUTS-1:0] current_spiked, current_spiked_next;
    logic [$clog2(NUM_INPUTS)-1:0] remaining_spikes_count, remaining_spikes_count_next, new_spikes_count;
    //remaining count logic
    always_ff @(posedge aclk, posedge grst) begin
        if(grst) begin
            remaining_spikes_count <= K[$clog2(NUM_INPUTS)-1:0];
        end else begin
            remaining_spikes_count <= remaining_spikes_count_next;
        end
    end

    //generate next current spikes
    always_comb begin
        current_spiked_next = current_spiked;
        new_spikes_count = '0;
        for(int i = 0; i < NUM_INPUTS; i++) begin
            if(input_spikes[i] & (~current_spiked[i])) begin
                //if this is a new spike
                if(new_spikes_count < remaining_spikes_count) begin
                    //if we're not at K yet
                    current_spiked_next[i] = 1'b1;
                    new_spikes_count += 1;
                end
            end
        end
    end
    //update remanining spike count
    assign remaining_spikes_count_next = remaining_spikes_count - new_spikes_count;

    always_ff @( posedge aclk , posedge grst) begin
        if(grst) begin
            current_spiked <= '0;
        end else begin
            current_spiked <= current_spiked_next;
        end
    end
    //output logic, this is essentially a mealy machine
    assign output_spikes = current_spiked_next;
`endif


endmodule: kwta