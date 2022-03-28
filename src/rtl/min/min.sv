`default_nettype none

module min
#(parameter GAMMA_CYCLE_WIDTH=16,
  parameter PULSE_WIDTH=8)
(
    input logic aclk,
    input logic grst,
    input logic a,
    input logic b,
    output logic y
);
`ifdef RISING
// rising edge transition base
    assign y = (a | b);

`elsif FALLING
// falling edge transition base (JES_STC_GRL_2_12_20.pdf)
    assign y = (a & b);

`else
// pulse width base
    logic temp_out;
    logic [$clog2(PULSE_WIDTH):0] counter, counter_next;
    
    assign temp_out = (a | b);
    assign y = (temp_out && (counter != (PULSE_WIDTH)) | ((counter > '0) && (counter < PULSE_WIDTH));

    always_ff @( posedge aclk, posedge grst) begin
        if(grst) begin
            counter <= '0;
        end else if (y) begin
            counter <= counter_next;
        end
    end

    always_comb begin
        if(counter == PULSE_WIDTH) begin
            counter_next = counter;
        end else begin
            counter_next = counter + 1'b1;
        end
    end

`endif

endmodule: min