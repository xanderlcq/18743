module sr_latch(
    input logic s,
    input logic r,
    output logic q,
    output logic q_b
);
    assign q = ~(r | q_b);
    assign q_b = ~(s | q);
endmodule: sr_latch