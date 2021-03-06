`default_nettype none

module binary2unary
#(parameter GAMMA_CYCLE_WIDTH=16,
  parameter PULSE_WIDTH = 8,
  parameter INPUT_WIDTH = $clog2(GAMMA_CYCLE_WIDTH))
(
    input logic grst, //1 cycle wide pulse generated by gclkc
    input logic aclk,
    input logic [INPUT_WIDTH-1:0] binary_input,
    output logic unary_output
);

`ifdef RISING
    logic [INPUT_WIDTH:0] counter;

    always_ff @(posedge aclk, posedge grst) begin
        if (grst) begin
            counter <= 'b0;
        end else begin
            counter <= counter + 1'b1;
        end
    end

    assign unary_output = (counter > binary_input);

`elsif FALLING
    logic [INPUT_WIDTH:0] counter;

    always_ff @(posedge aclk, posedge grst) begin
        if (grst) begin
            counter <= 'b0;
        end else begin
            counter <= counter + 1'b1;
        end
    end

    assign unary_output = (counter <= binary_input);

`else
    logic [INPUT_WIDTH:0] counter;

    always_ff @(posedge aclk, posedge grst) begin
        if (grst) begin
            counter <= 'b0;
        end else begin
            counter <= counter + 1'b1;
        end
    end

    assign unary_output = (counter > binary_input) & (counter <= (binary_input + PULSE_WIDTH));

`endif

endmodule: binary2unary