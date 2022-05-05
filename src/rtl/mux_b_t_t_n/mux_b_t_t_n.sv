`default_nettype none

module mux_b_t_t_n
#(parameter GAMMA_CYCLE_WIDTH=16,
  parameter PULSE_WIDTH=8,
  parameter NUM_INPUTS=16,
  parameter INPUT_WIDTH = $clog2(GAMMA_CYCLE_WIDTH) 
)
(
    input logic grst,
    input logic aclk,
    //binary
    input logic [NUM_INPUTS-1:0][INPUT_WIDTH-1:0] inputs,

    //temporal
    input logic select,
    output logic [NUM_INPUTS-1:0][INPUT_WIDTH-1:0] out
);
`ifdef RISING
    logic [$clog2(GAMMA_CYCLE_WIDTH)-1:0] counter, select_value, select_value_next;
    always_ff @( posedge aclk, posedge grst ) begin
        if(grst) begin
            counter <= '0;
            select_value <= '0;
        end else begin
            counter <= counter + 1;
            select_value <= select_value_next;
        end
    end    

    //store if has never stored before
    assign select_value_next = (select && (select_value == 0)) ? counter : select_value;

    genvar i;

    generate
        for(i = 0; i < NUM_INPUTS; i++) begin
            always_comb begin
                if(inputs[i] == select_value_next) begin
                    out[i] = inputs[i];
                end else begin
                    out[i] = '0;
                end
            end
        end
    endgenerate
`endif

endmodule
