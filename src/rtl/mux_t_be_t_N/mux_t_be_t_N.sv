`default_nettype none

module mux_t_be_t_N
#(parameter GAMMA_CYCLE_WIDTH=16,
  parameter PULSE_WIDTH=8,
  parameter NUM_INPUTS=GAMMA_CYCLE_WIDTH,
  parameter SELECT_WIDTH=$clog2(GAMMA_CYCLE_WIDTH)
)
(
    input logic grst,
    input logic aclk,
    input logic [NUM_INPUTS-1:0] inputs,
    input logic [SELECT_WIDTH-1:0] select,
    output logic [NUM_INPUTS-1:0] out
);
`ifdef RISING
// rising edge transition base
    genvar i;
    logic temp_unary_select, unary_select;
    logic [NUM_INPUTS-1:0] temp_inputs;

    binary2unary convertor(.grst(grst), .aclk(aclk), .binary_input(select), .unary_output(unary_select));

    always_ff @(posedge aclk, posedge grst) begin
        if (grst) begin
            temp_inputs <= 'b0;
            temp_unary_select <= 'b0;
        end else begin
            temp_inputs <= inputs;
            temp_unary_select <= unary_select;
        end
    end

    generate
      for(i=0; i<NUM_INPUTS; i++)
      begin: eq
        equal inst(.grst(grst), .aclk(aclk), .a(temp_unary_select), .b(temp_inputs[i]), .y(out[i]));
      end
    endgenerate
    
`elsif FALLING
// falling edge transition base
    logic [NUM_INPUTS-1:0] out;
    genvar i;

    generate
      for(i=0; i<NUM_INPUTS; i++)
      begin: eq
        equal inst(.rst(grst), .a(select), .b(inputs[i]), .y(out[i]));
      end
    endgenerate

    assign y = | out;
`else
// pulse width base


`endif

endmodule: mux_t_be_t_N
