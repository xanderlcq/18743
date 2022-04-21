`default_nettype none


module mux_2to1
#(parameter N=2)
(
    input logic [N-1:0] inputs,
    input logic [$clog2(N)-1:0] select_line,
    output logic y
);
    assign y = select_line ? inputs[1] : inputs[0];

endmodule: mux_2to1



module mux_16to1
#(parameter N=16,
  parameter WIDTH=8)
(
    input logic [N-1:0] [WIDTH-1:0] inputs,
    input logic [$clog2(N)-1:0] select_line,
    output logic [WIDTH-1:0] y
);
    
    always_comb begin
        case(select_line)
            'd0 : y = inputs[0];
            'd1 : y = inputs[1];
            'd2 : y = inputs[2];
            'd3 : y = inputs[3];
            'd4 : y = inputs[4];
            'd5 : y = inputs[5];
            'd6 : y = inputs[6];
            'd7 : y = inputs[7];
            'd8 : y = inputs[8];
            'd9 : y = inputs[9];
            'd10 : y = inputs[10];
            'd11 : y = inputs[11];
            'd12 : y = inputs[12];
            'd13 : y = inputs[13];
            'd14 : y = inputs[14];
            'd15 : y = inputs[15];
        endcase
    end

endmodule: mux_16to1