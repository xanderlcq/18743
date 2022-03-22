module sr_latch(
    input logic s,
    input logic r,
    output logic q,
    output logic q_b
);
    assign q = ~(s | q_b);
    assign q_b = ~(r | q);
endmodule: sr_latch