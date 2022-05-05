`default_nettype none

module mux_t_t_t_N
#(parameter GAMMA_CYCLE_WIDTH=16,
  parameter PULSE_WIDTH=8,
  parameter NUM_INPUTS=GAMMA_CYCLE_WIDTH)
(
    input logic grst,
    input logic [NUM_INPUTS-1:0] inputs,
    input logic select_line,
    output logic [NUM_INPUTS-1:0] y
);
`ifdef RISING
// rising edge transition base
    genvar i;

    generate
      for(i=0; i<NUM_INPUTS; i++)
      begin: eq
        equal inst(.grst(grst), .a(select_line), .b(inputs[i]), .y(y[i]));
      end
    endgenerate

    
`elsif FALLING
// falling edge transition base
    genvar i;

    generate
      for(i=0; i<NUM_INPUTS; i++)
      begin: eq
        equal inst(.grst(grst), .a(select_line), .b(inputs[i]), .y(y[i]));
      end
    endgenerate
    
`else
// pulse width base


`endif

endmodule: mux_t_t_t_N
