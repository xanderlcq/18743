`default_nettype none

module greater_than_eq
#(parameter GAMMA_CYCLE_WIDTH=16,
  parameter PULSE_WIDTH=8)
(
    input logic rst,
    input logic grst,
    input logic aclk,
    input logic a,
    input logic b,
    output logic q
);

`ifdef RISING
// rising edge transition base
    logic c, d;
    assign c = (a & (~b));
    sr_latch sr(.s(c), .r(rst), .q(d), .q_b());
    assign q = ~(d | a);

`elsif FALLING
// falling edge transition base (JES_STC_GRL_2_12_20.pdf)
    logic c, d;
    assign c = ((~a) & b);
    sr_latch sr(.s(c), .r(rst), .q(d), .q_b());
    assign q = d | a;

`else
// pulse width base

    logic [$clog2(PULSE_WIDTH):0] counter, counter_next, temp_out;
    
    logic c, d;
    assign c = (a & (~b));
    sr_latch sr(.s(c), .r(rst), .q(d), .q_b());
    assign temp_out = ~(d | a);
    
    assign q = (temp_out && (counter != (PULSE_WIDTH)) | ((counter > '0) && (counter < PULSE_WIDTH));

    always_ff @( posedge aclk, posedge grst) begin
        if(grst) begin
            counter <= '0;
        end else if (q) begin
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

endmodule: greater_than_eq