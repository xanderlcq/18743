`default_nettype none

module mux_t_t_t_1
#(parameter NUM_INPUTS=4,
  parameter GAMMA_CYCLE_WIDTH=16,
  parameter PULSE_WIDTH=8)
(
    input logic grst,
    input logic [NUM_INPUTS-1:0] inputs,
    input logic select_line,
    output logic y
);
`ifdef RISING
// rising edge transition base
    logic [NUM_INPUTS-1:0] out;
    genvar i;

    generate
      for(i=0; i<NUM_INPUTS; i++)
      begin: eq
        equal inst(.rst(grst), .a(select_line), .b(inputs[i]), .y(out[i]));
      end
    endgenerate

    assign y = | out;
    
`elsif FALLING
// falling edge transition base
    logic [NUM_INPUTS-1:0] out;
    genvar i;

    generate
      for(i=0; i<NUM_INPUTS; i++)
      begin: eq
        equal inst(.rst(grst), .a(select_line), .b(inputs[i]), .y(out[i]));
      end
    endgenerate

    assign y = | out;
`else
// pulse width base


`endif

endmodule: mux_t_t_t_1
