`default_nettype none

module exclusive_max
#(parameter GAMMA_CYCLE_WIDTH=16,
  parameter PULSE_WIDTH=8)
(
    input logic aclk,
    input logic grst,
    input logic set,
    input logic a,
    input logic b,
    output logic q
);
`ifdef RISING
//edge transition base, rising

    logic c, d, e, f, g, h;
    
    assign c = ((~a) & (b));
    assign d = ((a) & (~b));
    assign e = ((~c) & (~d));
    assign f = ((~a) | (~b));

    sr_latch sr(.s(set), .r(~e), .q(g), .q_b());

    assign h = g & e;
    assign q = ~(h | f);

`elsif FALLING
//edge transition base, falling, JES_STC_GRL_2_12_20.pdf

    logic c, d, e, f, g, h;
    
    assign c = ((a) & (~b));
    assign d = ((~a) & (b));
    assign e = ((~c) & (~d));
    assign f = a | b;

    sr_latch sr(.s(set), .r(~e), .q(g), .q_b());

    assign h = g & e;
    assign q = h | f;

`else
//pulse width base
    logic temp_out;
    logic [$clog2(PULSE_WIDTH):0] counter, counter_next;
    logic c, d, e, f, g, h;
    
    assign c = ((~a) & (b));
    assign d = ((a) & (~b));
    assign e = ((~c) & (~d));
    assign f = ((~a) | (~b));

    sr_latch sr(.s(set), .r(~e), .q(g), .q_b());

    assign h = g & e;
    assign temp_out = ~(h | f);
    assign q = (temp_out && (counter != (PULSE_WIDTH)) | ((counter > '0) && (counter < PULSE_WIDTH));

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

endmodule: exclusive_max