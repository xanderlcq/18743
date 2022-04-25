`default_nettype none

module mux_b_t_s
#(parameter GAMMA_CYCLE_WIDTH=16,
  parameter PULSE_WIDTH=8,
  parameter NUM_INPUTS=GAMMA_CYCLE_WIDTH,
  parameter BUS_WIDTH=8)
(
    input logic aclk,
    input logic grst,
    input logic [NUM_INPUTS-1:0] [BUS_WIDTH-1:0] inputs,
    input logic select_line,
    output logic [BUS_WIDTH-1:0] y
);
`ifdef RISING
// rising edge transition base
    logic [$clog2(GAMMA_CYCLE_WIDTH)-1:0] counter, counter_next;
    logic [BUS_WIDTH-1:0] temp_out;

    always_ff @(posedge aclk, posedge grst) begin
        if (grst) begin
            counter <= 'b0;
        end else begin
            counter <= counter_next;
        end
    end

    assign counter_next = counter + !select_line;
    assign y = select_line ? temp_out : 'b0;

    mux_16to1 mux_output (inputs, counter, temp_out);

`elsif FALLING
// falling edge transition base
    logic [$clog2(GAMMA_CYCLE_WIDTH)-1:0] counter, counter_next;
    logic [BUS_WIDTH-1:0] temp_out;

    always_ff @(posedge aclk, posedge grst) begin
        if (grst) begin
            counter <= 'b0;
        end else begin
            counter <= counter_next;
        end
    end

    assign counter_next = counter + select_line;
    assign y = select_line ? 'b0 : temp_out;

    mux_16to1 mux_output (inputs, counter, temp_out);

`else
// pulse width base


`endif

endmodule: mux_b_t_s