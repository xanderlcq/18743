`default_nettype none

module exclusive_min
#(parameter GAMMA_CYCLE_WIDTH=16,
  parameter PULSE_WIDTH=8)
(
    input logic aclk,
    input logic grst,
    input logic rst,
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
    assign f = ((~a) & (~b));

    sr_latch sr(.s(rst), .r(~e), .q(g), .q_b());

    assign h = g & e;
    assign q = ~(h | f);

`elsif FALLING
//edge transition base, falling, JES_STC_GRL_2_12_20.pdf

    logic c, d, e, f, g, h;
    assign c = ((a) & (~b));
    assign d = ((~a) & (b));
    assign e = ((~c) & (~d));
    assign f = a & b;

    sr_latch sr(.s(rst), .r(~e), .q(g), .q_b());

    assign h = g & e;
    assign q = h | f;

`else
//pulse width base
    logic temp_out, ouptut_latch_set_1, ouptut_latch_set_2;
    logic a_select, b_select, prev_temp_out, prev_a, prev_b;
    logic c, d, e, f, g, h;
    
    assign c = ((~a) & (b));
    assign d = ((a) & (~b));
    assign e = ((~c) & (~d));
    assign f = ((~a) & (~b));

    sr_latch sr(.s(rst), .r(~e), .q(g), .q_b());

    assign h = g & e;
    assign temp_out = ~(h | f);
    assign q = (a_select & a) | (b_select & b);
    
    always_ff @(posedge aclk, posedge grst) begin
        if (grst) begin
            prev_a <= 0;
            prev_temp_out <= 0;
        end else begin
            prev_a <= a;
            prev_temp_out <= temp_out;
        end
    end

    sr_latch sr1(.s(ouptut_latch_set_1), .r(rst), .q(a_select), .q_b());
    sr_latch sr2(.s(ouptut_latch_set_2), .r(rst), .q(b_select), .q_b());

    always_comb begin        
        if ((!prev_a & a) && (!prev_temp_out & temp_out)) begin
            ouptut_latch_set_1 = 1;
        end else begin
            ouptut_latch_set_1 = 0;
        end
    end

    always_comb begin        
        if ((!prev_b & b) && (!prev_temp_out & temp_out)) begin
            ouptut_latch_set_2 = 1;
        end else begin
            ouptut_latch_set_2 = 0;
        end
    end

`endif

endmodule: exclusive_min