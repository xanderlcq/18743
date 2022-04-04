
// Generated by Cadence Genus(TM) Synthesis Solution 18.14-s037_1
// Generated on: Apr  3 2022 19:21:20 EDT (Apr  3 2022 23:21:20 UTC)

// Verification Directory fv/wrapper 

module sr_latch(s, r, q, q_b);
  input s, r;
  output q, q_b;
  wire s, r;
  wire q, q_b;
  wire n_0, n_1;
  HB1xp67_ASAP7_75t_R cdn_loop_breaker(.A (q), .Y (n_1));
  NOR2xp33_ASAP7_75t_R g28__8780(.A (n_0), .B (r), .Y (q));
  NOR2xp33_ASAP7_75t_R g29__4296(.A (n_1), .B (s), .Y (n_0));
endmodule

module less_than_eq(rst, a, b, q);
  input rst, a, b;
  output q;
  wire rst, a, b;
  wire q;
endmodule

module wta_1_GAMMA_CYCLE_WIDTH16_PULSE_WIDTH8_NUM_INPUTS16(rst,
     input_spikes, output_spikes);
  input rst;
  input [15:0] input_spikes;
  output [15:0] output_spikes;
  wire rst;
  wire [15:0] input_spikes;
  wire [15:0] output_spikes;
  wire [15:0] lteq_outputs;
  wire UNCONNECTED, inhibit, n_0, n_1, n_2, n_3, n_4, n_5;
  wire n_6, n_7, n_8, n_9, n_10, n_11, n_12, n_13;
  wire n_14, n_15, n_16, n_17, n_18, n_19, n_20, n_21;
  wire n_35, spiked;
  sr_latch Inhibit_sr(.s (spiked), .r (rst), .q (inhibit), .q_b
       (UNCONNECTED));
  less_than_eq \genblk1_0_.Lteq (.rst (rst), .a (input_spikes[0]), .b
       (inhibit), .q (output_spikes[0]));
  less_than_eq \genblk1_1_.Lteq (.rst (rst), .a (input_spikes[1]), .b
       (inhibit), .q (lteq_outputs[1]));
  less_than_eq \genblk1_2_.Lteq (.rst (rst), .a (input_spikes[2]), .b
       (inhibit), .q (lteq_outputs[2]));
  less_than_eq \genblk1_3_.Lteq (.rst (rst), .a (input_spikes[3]), .b
       (inhibit), .q (lteq_outputs[3]));
  less_than_eq \genblk1_4_.Lteq (.rst (rst), .a (input_spikes[4]), .b
       (inhibit), .q (lteq_outputs[4]));
  less_than_eq \genblk1_5_.Lteq (.rst (rst), .a (input_spikes[5]), .b
       (inhibit), .q (lteq_outputs[5]));
  less_than_eq \genblk1_6_.Lteq (.rst (rst), .a (input_spikes[6]), .b
       (inhibit), .q (lteq_outputs[6]));
  less_than_eq \genblk1_7_.Lteq (.rst (rst), .a (input_spikes[7]), .b
       (inhibit), .q (lteq_outputs[7]));
  less_than_eq \genblk1_8_.Lteq (.rst (rst), .a (input_spikes[8]), .b
       (inhibit), .q (lteq_outputs[8]));
  less_than_eq \genblk1_9_.Lteq (.rst (rst), .a (input_spikes[9]), .b
       (inhibit), .q (lteq_outputs[9]));
  less_than_eq \genblk1_10_.Lteq (.rst (rst), .a (input_spikes[10]), .b
       (inhibit), .q (lteq_outputs[10]));
  less_than_eq \genblk1_11_.Lteq (.rst (rst), .a (input_spikes[11]), .b
       (inhibit), .q (lteq_outputs[11]));
  less_than_eq \genblk1_12_.Lteq (.rst (rst), .a (input_spikes[12]), .b
       (inhibit), .q (lteq_outputs[12]));
  less_than_eq \genblk1_13_.Lteq (.rst (rst), .a (input_spikes[13]), .b
       (inhibit), .q (lteq_outputs[13]));
  less_than_eq \genblk1_14_.Lteq (.rst (rst), .a (input_spikes[14]), .b
       (inhibit), .q (lteq_outputs[14]));
  less_than_eq \genblk1_15_.Lteq (.rst (rst), .a (input_spikes[15]), .b
       (inhibit), .q (lteq_outputs[15]));
  NOR2x1_ASAP7_75t_R g645__3772(.A (lteq_outputs[14]), .B (n_21), .Y
       (output_spikes[15]));
  AND2x2_ASAP7_75t_R g646__1474(.A (lteq_outputs[14]), .B (n_20), .Y
       (output_spikes[14]));
  NAND2xp33_ASAP7_75t_R g647__4547(.A (lteq_outputs[15]), .B (n_20), .Y
       (n_21));
  NAND2xp33_ASAP7_75t_R g648__9682(.A (n_3), .B (n_20), .Y (spiked));
  NOR2x1_ASAP7_75t_R g649__2683(.A (lteq_outputs[12]), .B (n_19), .Y
       (output_spikes[13]));
  NOR3xp33_ASAP7_75t_R g650__1309(.A (n_17), .B (lteq_outputs[12]), .C
       (lteq_outputs[13]), .Y (n_20));
  NAND2xp33_ASAP7_75t_R g651__6877(.A (lteq_outputs[13]), .B (n_18), .Y
       (n_19));
  AND2x2_ASAP7_75t_R g652__2900(.A (lteq_outputs[12]), .B (n_18), .Y
       (output_spikes[12]));
  NOR2x1_ASAP7_75t_R g653__2391(.A (lteq_outputs[10]), .B (n_16), .Y
       (output_spikes[11]));
  INVx1_ASAP7_75t_R g654(.A (n_18), .Y (n_17));
  NOR3xp33_ASAP7_75t_R g655__7675(.A (n_13), .B (lteq_outputs[10]), .C
       (lteq_outputs[11]), .Y (n_18));
  NAND2xp33_ASAP7_75t_R g656__7118(.A (lteq_outputs[11]), .B (n_14), .Y
       (n_16));
  AND2x2_ASAP7_75t_R g657__8757(.A (lteq_outputs[10]), .B (n_14), .Y
       (output_spikes[10]));
  NOR2x1_ASAP7_75t_R g658__1786(.A (lteq_outputs[8]), .B (n_15), .Y
       (output_spikes[9]));
  NAND2xp33_ASAP7_75t_R g659__5953(.A (lteq_outputs[9]), .B (n_11), .Y
       (n_15));
  AND2x2_ASAP7_75t_R g660__5703(.A (lteq_outputs[8]), .B (n_11), .Y
       (output_spikes[8]));
  INVx1_ASAP7_75t_R g661(.A (n_14), .Y (n_13));
  NOR2x1_ASAP7_75t_R g662__7114(.A (lteq_outputs[6]), .B (n_12), .Y
       (output_spikes[7]));
  NOR3xp33_ASAP7_75t_R g663__5266(.A (n_10), .B (lteq_outputs[9]), .C
       (lteq_outputs[8]), .Y (n_14));
  NAND2xp33_ASAP7_75t_R g664__2250(.A (lteq_outputs[7]), .B (n_9), .Y
       (n_12));
  INVx1_ASAP7_75t_R g665(.A (n_11), .Y (n_10));
  AND2x2_ASAP7_75t_R g666__6083(.A (lteq_outputs[6]), .B (n_9), .Y
       (output_spikes[6]));
  NOR3xp33_ASAP7_75t_R g667__2703(.A (n_8), .B (lteq_outputs[6]), .C
       (lteq_outputs[7]), .Y (n_11));
  NOR2x1_ASAP7_75t_R g668__5795(.A (lteq_outputs[4]), .B (n_7), .Y
       (output_spikes[5]));
  INVx1_ASAP7_75t_R g669(.A (n_9), .Y (n_8));
  NOR3xp33_ASAP7_75t_R g670__7344(.A (n_5), .B (lteq_outputs[4]), .C
       (lteq_outputs[5]), .Y (n_9));
  AND2x2_ASAP7_75t_R g671__1840(.A (lteq_outputs[4]), .B (n_6), .Y
       (output_spikes[4]));
  NAND2xp33_ASAP7_75t_R g672__5019(.A (lteq_outputs[5]), .B (n_6), .Y
       (n_7));
  INVx1_ASAP7_75t_R g673(.A (n_6), .Y (n_5));
  NOR2xp33_ASAP7_75t_R g674__1857(.A (lteq_outputs[3]), .B (n_4), .Y
       (n_6));
  NOR2x1_ASAP7_75t_R g675__9906(.A (n_1), .B (n_4), .Y
       (output_spikes[3]));
  NOR3xp33_ASAP7_75t_R g676__8780(.A (n_2), .B (lteq_outputs[1]), .C
       (output_spikes[0]), .Y (n_35));
  OR3x1_ASAP7_75t_R g677__4296(.A (lteq_outputs[2]), .B
       (output_spikes[0]), .C (lteq_outputs[1]), .Y (n_4));
  NOR2x1_ASAP7_75t_R g678__3772(.A (output_spikes[0]), .B (n_0), .Y
       (output_spikes[1]));
  NOR2xp33_ASAP7_75t_R g679__1474(.A (lteq_outputs[14]), .B
       (lteq_outputs[15]), .Y (n_3));
  INVx1_ASAP7_75t_R g680(.A (lteq_outputs[2]), .Y (n_2));
  INVxp67_ASAP7_75t_R g681(.A (lteq_outputs[3]), .Y (n_1));
  INVxp67_ASAP7_75t_R g682(.A (lteq_outputs[1]), .Y (n_0));
  HB1xp67_ASAP7_75t_R drc_bufs(.A (n_35), .Y (output_spikes[2]));
endmodule

module wrapper(aclk, rst, input_spikes, output_spikes);
  input aclk, rst;
  input [15:0] input_spikes;
  output [15:0] output_spikes;
  wire aclk, rst;
  wire [15:0] input_spikes;
  wire [15:0] output_spikes;
  wire [15:0] dummy;
  wire n_9, n_10, n_11, n_12, n_13, n_14, n_15, n_16;
  wire n_17, n_18, n_19, n_20, n_21, n_22, n_23, n_24;
  wire n_25, n_26, n_27, n_28, n_29, n_30, n_31, n_32;
  wire n_33, n_34, n_35, n_36, n_37, n_38, n_39, n_40;
  wire n_41, n_42, n_43, n_44, n_45, n_46, n_47, n_48;
  wire n_49, n_50, n_51, n_52, n_53, n_54, n_55, n_56;
  wire n_57;
  wta_1_GAMMA_CYCLE_WIDTH16_PULSE_WIDTH8_NUM_INPUTS16 DUT(.rst (rst),
       .input_spikes (dummy), .output_spikes (output_spikes));
  ASYNC_DFFHx1_ASAP7_75t_R \dummy_reg[0] (.RESET (n_47), .SET (n_30),
       .CLK (aclk), .D (n_12), .QN (dummy[0]));
  ASYNC_DFFHx1_ASAP7_75t_R \dummy_reg[14] (.RESET (n_49), .SET (n_32),
       .CLK (aclk), .D (n_24), .QN (dummy[14]));
  ASYNC_DFFHx1_ASAP7_75t_R \dummy_reg[12] (.RESET (n_51), .SET (n_33),
       .CLK (aclk), .D (n_10), .QN (dummy[12]));
  ASYNC_DFFHx1_ASAP7_75t_R \dummy_reg[8] (.RESET (n_55), .SET (n_38),
       .CLK (aclk), .D (n_18), .QN (dummy[8]));
  ASYNC_DFFHx1_ASAP7_75t_R \dummy_reg[15] (.RESET (n_48), .SET (n_26),
       .CLK (aclk), .D (n_20), .QN (dummy[15]));
  ASYNC_DFFHx1_ASAP7_75t_R \dummy_reg[7] (.RESET (n_56), .SET (n_39),
       .CLK (aclk), .D (n_9), .QN (dummy[7]));
  ASYNC_DFFHx1_ASAP7_75t_R \dummy_reg[11] (.RESET (n_52), .SET (n_34),
       .CLK (aclk), .D (n_15), .QN (dummy[11]));
  ASYNC_DFFHx1_ASAP7_75t_R \dummy_reg[6] (.RESET (n_42), .SET (n_40),
       .CLK (aclk), .D (n_14), .QN (dummy[6]));
  ASYNC_DFFHx1_ASAP7_75t_R \dummy_reg[3] (.RESET (n_44), .SET (n_27),
       .CLK (aclk), .D (n_22), .QN (dummy[3]));
  ASYNC_DFFHx1_ASAP7_75t_R \dummy_reg[13] (.RESET (n_50), .SET (n_31),
       .CLK (aclk), .D (n_17), .QN (dummy[13]));
  ASYNC_DFFHx1_ASAP7_75t_R \dummy_reg[10] (.RESET (n_53), .SET (n_35),
       .CLK (aclk), .D (n_19), .QN (dummy[10]));
  ASYNC_DFFHx1_ASAP7_75t_R \dummy_reg[4] (.RESET (n_43), .SET (n_41),
       .CLK (aclk), .D (n_13), .QN (dummy[4]));
  ASYNC_DFFHx1_ASAP7_75t_R \dummy_reg[5] (.RESET (n_57), .SET (n_36),
       .CLK (aclk), .D (n_11), .QN (dummy[5]));
  ASYNC_DFFHx1_ASAP7_75t_R \dummy_reg[9] (.RESET (n_54), .SET (n_37),
       .CLK (aclk), .D (n_25), .QN (dummy[9]));
  ASYNC_DFFHx1_ASAP7_75t_R \dummy_reg[2] (.RESET (n_45), .SET (n_28),
       .CLK (aclk), .D (n_21), .QN (dummy[2]));
  ASYNC_DFFHx1_ASAP7_75t_R \dummy_reg[1] (.RESET (n_46), .SET (n_29),
       .CLK (aclk), .D (n_16), .QN (dummy[1]));
  NOR2xp33_ASAP7_75t_R g614__4547(.A (input_spikes[5]), .B (n_23), .Y
       (n_57));
  NOR2xp33_ASAP7_75t_R g615__9682(.A (input_spikes[7]), .B (n_23), .Y
       (n_56));
  NOR2xp33_ASAP7_75t_R g616__2683(.A (input_spikes[8]), .B (n_23), .Y
       (n_55));
  NOR2xp33_ASAP7_75t_R g617__1309(.A (input_spikes[9]), .B (n_23), .Y
       (n_54));
  NOR2xp33_ASAP7_75t_R g618__6877(.A (input_spikes[10]), .B (n_23), .Y
       (n_53));
  NOR2xp33_ASAP7_75t_R g619__2900(.A (input_spikes[11]), .B (n_23), .Y
       (n_52));
  NOR2xp33_ASAP7_75t_R g620__2391(.A (input_spikes[12]), .B (n_23), .Y
       (n_51));
  NOR2xp33_ASAP7_75t_R g621__7675(.A (input_spikes[13]), .B (n_23), .Y
       (n_50));
  NOR2xp33_ASAP7_75t_R g622__7118(.A (input_spikes[14]), .B (n_23), .Y
       (n_49));
  NOR2xp33_ASAP7_75t_R g623__8757(.A (input_spikes[15]), .B (n_23), .Y
       (n_48));
  NOR2xp33_ASAP7_75t_R g624__1786(.A (input_spikes[0]), .B (n_23), .Y
       (n_47));
  NOR2xp33_ASAP7_75t_R g625__5953(.A (input_spikes[1]), .B (n_23), .Y
       (n_46));
  NOR2xp33_ASAP7_75t_R g626__5703(.A (input_spikes[2]), .B (n_23), .Y
       (n_45));
  NOR2xp33_ASAP7_75t_R g627__7114(.A (input_spikes[3]), .B (n_23), .Y
       (n_44));
  NOR2xp33_ASAP7_75t_R g628__5266(.A (input_spikes[4]), .B (n_23), .Y
       (n_43));
  NOR2xp33_ASAP7_75t_R g629__2250(.A (input_spikes[6]), .B (n_23), .Y
       (n_42));
  AND2x2_ASAP7_75t_R g630__6083(.A (input_spikes[4]), .B (rst), .Y
       (n_41));
  AND2x2_ASAP7_75t_R g631__2703(.A (input_spikes[6]), .B (rst), .Y
       (n_40));
  AND2x2_ASAP7_75t_R g632__5795(.A (input_spikes[7]), .B (rst), .Y
       (n_39));
  AND2x2_ASAP7_75t_R g633__7344(.A (input_spikes[8]), .B (rst), .Y
       (n_38));
  AND2x2_ASAP7_75t_R g634__1840(.A (input_spikes[9]), .B (rst), .Y
       (n_37));
  AND2x2_ASAP7_75t_R g635__5019(.A (input_spikes[5]), .B (rst), .Y
       (n_36));
  AND2x2_ASAP7_75t_R g636__1857(.A (input_spikes[10]), .B (rst), .Y
       (n_35));
  AND2x2_ASAP7_75t_R g637__9906(.A (input_spikes[11]), .B (rst), .Y
       (n_34));
  AND2x2_ASAP7_75t_R g638__8780(.A (input_spikes[12]), .B (rst), .Y
       (n_33));
  AND2x2_ASAP7_75t_R g639__4296(.A (input_spikes[14]), .B (rst), .Y
       (n_32));
  AND2x2_ASAP7_75t_R g640__3772(.A (input_spikes[13]), .B (rst), .Y
       (n_31));
  AND2x2_ASAP7_75t_R g641__1474(.A (input_spikes[0]), .B (rst), .Y
       (n_30));
  AND2x2_ASAP7_75t_R g642__4547(.A (input_spikes[1]), .B (rst), .Y
       (n_29));
  AND2x2_ASAP7_75t_R g643__9682(.A (input_spikes[2]), .B (rst), .Y
       (n_28));
  AND2x2_ASAP7_75t_R g644__2683(.A (input_spikes[3]), .B (rst), .Y
       (n_27));
  AND2x2_ASAP7_75t_R g645__1309(.A (input_spikes[15]), .B (rst), .Y
       (n_26));
  INVx1_ASAP7_75t_R g646(.A (output_spikes[9]), .Y (n_25));
  INVx1_ASAP7_75t_R g647(.A (output_spikes[14]), .Y (n_24));
  INVx1_ASAP7_75t_R g648(.A (rst), .Y (n_23));
  INVx1_ASAP7_75t_R g649(.A (output_spikes[3]), .Y (n_22));
  INVx1_ASAP7_75t_R g650(.A (output_spikes[2]), .Y (n_21));
  INVx1_ASAP7_75t_R g651(.A (output_spikes[15]), .Y (n_20));
  INVx1_ASAP7_75t_R g652(.A (output_spikes[10]), .Y (n_19));
  INVx1_ASAP7_75t_R g653(.A (output_spikes[8]), .Y (n_18));
  INVx1_ASAP7_75t_R g654(.A (output_spikes[13]), .Y (n_17));
  INVx1_ASAP7_75t_R g655(.A (output_spikes[1]), .Y (n_16));
  INVx1_ASAP7_75t_R g656(.A (output_spikes[11]), .Y (n_15));
  INVx1_ASAP7_75t_R g657(.A (output_spikes[6]), .Y (n_14));
  INVx1_ASAP7_75t_R g658(.A (output_spikes[4]), .Y (n_13));
  INVx1_ASAP7_75t_R g659(.A (output_spikes[0]), .Y (n_12));
  INVx1_ASAP7_75t_R g660(.A (output_spikes[5]), .Y (n_11));
  INVx1_ASAP7_75t_R g661(.A (output_spikes[12]), .Y (n_10));
  INVx1_ASAP7_75t_R g662(.A (output_spikes[7]), .Y (n_9));
endmodule

