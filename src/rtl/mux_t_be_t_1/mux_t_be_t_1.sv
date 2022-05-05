`default_nettype none

module mux_t_be_t_1
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
    output logic out
);
`ifdef RISING
// rising edge transition base
    genvar i;
    logic temp_unary_select, unary_select;
    logic [NUM_INPUTS-1:0] temp_inputs, temp_out;

    binary2unary convertor(.grst(grst), .aclk(aclk), .binary_input(select-1'b1), .unary_output(unary_select));

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
        equal inst(.grst(grst), .aclk(aclk), .a(temp_unary_select), .b(temp_inputs[i]), .y(temp_out[i]));
      end
    endgenerate

    assign out = | temp_out;
    
`elsif FALLING
// falling edge transition base
    genvar i;
    logic temp_unary_select, unary_select;
    logic [NUM_INPUTS-1:0] temp_inputs, temp_out;

    binary2unary convertor(.grst(grst), .aclk(aclk), .binary_input(select-1'b1), .unary_output(unary_select));

    always_ff @(posedge aclk, posedge grst) begin
        if (grst) begin
            temp_inputs <= 'b0;
            temp_unary_select <= 'b1;
        end else begin
            temp_inputs <= inputs;
            temp_unary_select <= unary_select;
        end
    end

    generate
      for(i=0; i<NUM_INPUTS; i++)
      begin: eq
        equal inst(.grst(grst), .aclk(aclk), .a(temp_unary_select), .b(temp_inputs[i]), .y(temp_out[i]));
      end
    endgenerate

    assign out = | temp_out;

`else
// pulse width base
// rising edge transition base
    genvar i;
    logic temp_unary_select, unary_select;
    logic [NUM_INPUTS-1:0] temp_inputs, temp_out;

    binary2unary convertor(.grst(grst), .aclk(aclk), .binary_input(select-1'b1), .unary_output(unary_select));

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
        equal inst(.grst(grst), .aclk(aclk), .a(temp_unary_select), .b(temp_inputs[i]), .y(temp_out[i]));
      end
    endgenerate

    assign out = | temp_out;


`endif

endmodule: mux_t_be_t_1
