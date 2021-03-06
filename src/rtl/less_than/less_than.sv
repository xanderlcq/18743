`default_nettype none

module less_than
#(parameter GAMMA_CYCLE_WIDTH=16,
  parameter PULSE_WIDTH=8)
(
    input logic aclk,
    input logic grst,
    input logic a,
    input logic b,
    output logic q
);
`ifdef RISING
//edge transition base, rising
    logic c, d;
    assign c = (a & (~b));
    sr_latch sr(.s(grst), .r(c), .q(d), .q_b());
    assign q = (~d | c);

`elsif FALLING
//edge transition base, falling, JES_STC_GRL_2_12_20.pdf
    logic c, d;
    assign c = ((~a) & b);
    sr_latch sr(.s(grst), .r(c), .q(d), .q_b());
    assign q = (d & ~c);

`else
//pulse width base

    logic temp_out, ouptut_latch_set, a_select, prev_temp_out, prev_a;
    logic c, d;
    
    assign c = a & (~b);
    sr_latch sr(.s(grst), .r(c), .q(d), .q_b());
    assign temp_out = a & (~d);
    assign q = (a_select & a);
    
    always_ff @(posedge aclk, posedge grst) begin
        if (grst) begin
            prev_a <= 0;
            prev_temp_out <= 0;
        end else begin
            prev_a <= a;
            prev_temp_out <= temp_out;
        end
    end

    sr_latch sr1(.s(ouptut_latch_set), .r(grst), .q(a_select), .q_b());

    always_comb begin        
        if ((!prev_a & a) && (!prev_temp_out & temp_out)) begin
            ouptut_latch_set = 1;
        end else begin
            ouptut_latch_set = 0;
        end
    end

`endif

endmodule: less_than