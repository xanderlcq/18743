`default_nettype none

module not_equal
#(parameter GAMMA_CYCLE_WIDTH=16,
  parameter PULSE_WIDTH=8)
(
	input logic aclk,
    input logic grst,
    input logic rst,
    input logic a,
    input logic b,
    output logic y
);
`ifdef RISING
// rising edge transition base
    logic c, d, e;
    
    sr_latch sr(.s(rst), .r(c), .q(d), .q_b());
	
    assign c = ((~a) ^ (~b));
	assign e = ((~c) & d);
    assign y = ~((~a) | e);

`elsif FALLING
// falling edge transition base (JES_STC_GRL_2_12_20.pdf)
    logic c, d, e;
    
	sr_latch sr(.s(rst), .r(c), .q(d), .q_b());
	
    assign c = (a ^ b);
    assign e = ((~c) & d);
    assign y = (a | e);

`else
// pulse width base
    logic temp_out, ouptut_latch_set, a_select, prev_temp_out, prev_a;
    logic c, d, e;
    
    sr_latch sr(.s(rst), .r(c), .q(d), .q_b());    
    
    assign c = ((~a) ^ (~b));
    assign e = ((~c) & d);
    assign temp_out = ~((~a) | e);
    assign y = (a_select & a);
    
    always_ff @(posedge aclk, posedge grst) begin
        if (grst) begin
            prev_a <= 0;
            prev_temp_out <= 0;
        end else begin
            prev_a <= a;
            prev_temp_out <= temp_out;
        end
    end

    sr_latch sr1(.s(ouptut_latch_set), .r(rst), .q(a_select), .q_b());

    always_comb begin        
        if ((!prev_a & a) && (!prev_temp_out & temp_out)) begin
            ouptut_latch_set = 1;
        end else begin
            ouptut_latch_set = 0;
        end
    end

`endif

endmodule: not_equal