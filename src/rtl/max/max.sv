`default_nettype none

module max
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
    assign y = (a & b);

`elsif FALLING
// falling edge transition base (JES_STC_GRL_2_12_20.pdf)
    assign y = (a | b);

`else
// pulse width base

    logic temp_out, ouptut_latch_set_1, ouptut_latch_set_2;
    logic a_select, b_select, prev_temp_out, prev_a, prev_b;
    
    assign temp_out = (a & b);
    assign y = (a_select & a) | (b_select & b);
    
    always_ff @(posedge aclk, posedge grst) begin
        if (grst) begin
            prev_a <= 0;
            prev_temp_out <= 0;
        end else begin
            prev_a <= a;
            prev_temp_out <= temp_out;
        end
    end

    sr_latch sr1(.s(ouptut_latch_set_1), .r(grst), .q(a_select), .q_b());
    sr_latch sr2(.s(ouptut_latch_set_2), .r(grst), .q(b_select), .q_b());

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

endmodule: max
