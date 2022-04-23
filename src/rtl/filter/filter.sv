`default_nettype none

module filter
#(parameter GAMMA_CYCLE_WIDTH=16,
  parameter PULSE_WIDTH=8,
  parameter NUM_INPUTS=GAMMA_CYCLE_WIDTH)
(
    input logic aclk,
    input logic grst,
    input logic [NUM_INPUTS-1:0] inputs,
    input logic sel_greater,
    input logic sel_lesser,
    output logic [NUM_INPUTS-1:0] y
);
`ifdef RISING
// rising edge transition base
    logic [NUM_INPUTS-1:0] out_less, out_greater;
    genvar i;

    generate
        for (i = 0; i < NUM_INPUTS; i ++) begin
            greater_than_eq greater_than_inst(.rst(grst), .grst(grst), .aclk(aclk), .a(inputs[i]), .b(sel_greater), .q(out_greater[i]));
            less_than_eq less_than_inst(.rst(grst), .grst(grst), .aclk(aclk), .a(inputs[i]), .b(sel_lesser), .q(out_less[i]));
            and output_inst (y[i], out_less[i], out_greater[i]);
        end
    endgenerate


`elsif FALLING
// falling edge transition base

`else
// pulse width base


`endif

endmodule: filter