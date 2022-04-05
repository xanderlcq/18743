
// Generated by Cadence Genus(TM) Synthesis Solution 18.14-s037_1
// Generated on: Apr  4 2022 21:40:57 EDT (Apr  5 2022 01:40:57 UTC)

// Verification Directory fv/kwta 

module kwta(grst, aclk, input_spikes, output_spikes);
  input grst, aclk;
  input [15:0] input_spikes;
  output [15:0] output_spikes;
  wire grst, aclk;
  wire [15:0] input_spikes;
  wire [15:0] output_spikes;
  wire [3:0] remaining_spikes_count;
  wire [15:0] current_spiked;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_14, n_15, n_17;
  wire n_18, n_19, n_20, n_21, n_22, n_23, n_24, n_26;
  wire n_27, n_28, n_29, n_30, n_31, n_33, n_34, n_35;
  wire n_36, n_37, n_38, n_39, n_40, n_42, n_43, n_44;
  wire n_45, n_46, n_47, n_48, n_49, n_51, n_52, n_53;
  wire n_54, n_55, n_56, n_57, n_58, n_60, n_61, n_62;
  wire n_63, n_64, n_65, n_66, n_67, n_69, n_70, n_71;
  wire n_72, n_73, n_74, n_75, n_76, n_78, n_79, n_80;
  wire n_81, n_82, n_83, n_84, n_85, n_87, n_88, n_89;
  wire n_90, n_91, n_92, n_93, n_94, n_95, n_97, n_98;
  wire n_99, n_100, n_101, n_102, n_103, n_104, n_106, n_107;
  wire n_108, n_109, n_110, n_111, n_112, n_113, n_115, n_116;
  wire n_117, n_118, n_119, n_120, n_121, n_122, n_124, n_125;
  wire n_126, n_127, n_128, n_129, n_130, n_131, n_132, n_133;
  wire n_135, n_136, n_140, n_141, n_142, n_144, n_145, n_146;
  wire n_147, n_148, n_149, n_150, n_152, n_153, n_155, n_156;
  wire n_176, n_177, n_178;
  ASYNC_DFFHx1_ASAP7_75t_R \remaining_spikes_count_reg[2] (.RESET
       (1'b0), .SET (grst), .CLK (aclk), .D (n_156), .QN
       (remaining_spikes_count[2]));
  ASYNC_DFFHx1_ASAP7_75t_R \remaining_spikes_count_reg[1] (.RESET
       (grst), .SET (1'b0), .CLK (aclk), .D (n_155), .QN
       (remaining_spikes_count[1]));
  A2O1A1Ixp33_ASAP7_75t_R g3348__8780(.A1 (n_145), .A2 (n_176), .B
       (n_148), .C (n_147), .Y (n_156));
  XNOR2xp5_ASAP7_75t_R g3349__4296(.A (n_176), .B (n_146), .Y (n_155));
  ASYNC_DFFHx1_ASAP7_75t_R \remaining_spikes_count_reg[0] (.RESET
       (grst), .SET (1'b0), .CLK (aclk), .D (n_153), .QN
       (remaining_spikes_count[0]));
  ASYNC_DFFHx1_ASAP7_75t_R \current_spiked_reg[15] (.RESET (grst), .SET
       (1'b0), .CLK (aclk), .D (n_152), .QN (current_spiked[15]));
  XNOR2xp5_ASAP7_75t_R g3352__3772(.A (n_150), .B (n_142), .Y (n_153));
  INVx1_ASAP7_75t_R g3354(.A (output_spikes[15]), .Y (n_152));
  OR2x2_ASAP7_75t_R g3355__4547(.A (current_spiked[15]), .B (n_150), .Y
       (output_spikes[15]));
  NOR2xp33_ASAP7_75t_R g3356__9682(.A (current_spiked[15]), .B (n_149),
       .Y (n_150));
  OAI31xp33_ASAP7_75t_R g3357__2683(.A1 (n_148), .A2 (n_147), .A3
       (n_177), .B (input_spikes[15]), .Y (n_149));
  NOR2xp33_ASAP7_75t_R g3358__1309(.A (n_144), .B (n_148), .Y (n_146));
  INVxp67_ASAP7_75t_R g3359(.A (n_144), .Y (n_145));
  NOR2xp33_ASAP7_75t_R g3360__6877(.A (remaining_spikes_count[1]), .B
       (n_178), .Y (n_144));
  AND2x2_ASAP7_75t_R g3362__2900(.A (remaining_spikes_count[1]), .B
       (n_178), .Y (n_148));
  XNOR2xp5_ASAP7_75t_R g3361__7675(.A (n_141), .B (n_140), .Y (n_142));
  AOI21xp5_ASAP7_75t_R g3365__7118(.A1 (n_136), .A2 (n_127), .B
       (n_130), .Y (n_147));
  ASYNC_DFFHx1_ASAP7_75t_R \current_spiked_reg[14] (.RESET (grst), .SET
       (1'b0), .CLK (aclk), .D (n_135), .QN (current_spiked[14]));
  XNOR2xp5_ASAP7_75t_R g3368__1786(.A (n_133), .B (n_132), .Y (n_140));
  INVx1_ASAP7_75t_R g3371(.A (output_spikes[14]), .Y (n_135));
  NOR2xp33_ASAP7_75t_R g3370__5953(.A (n_133), .B (n_131), .Y (n_136));
  OR2x2_ASAP7_75t_R g3372__5703(.A (current_spiked[14]), .B (n_132), .Y
       (output_spikes[14]));
  INVx1_ASAP7_75t_R g3373(.A (n_132), .Y (n_131));
  AOI211xp5_ASAP7_75t_R g3374__7114(.A1 (n_130), .A2 (n_129), .B (n_6),
       .C (current_spiked[14]), .Y (n_132));
  AOI22xp5_ASAP7_75t_R g3375__5266(.A1 (remaining_spikes_count[1]), .A2
       (n_128), .B1 (remaining_spikes_count[0]), .B2 (n_133), .Y
       (n_129));
  INVxp67_ASAP7_75t_R g3377(.A (n_128), .Y (n_127));
  XNOR2xp5_ASAP7_75t_R g3378__2250(.A (n_125), .B (n_126), .Y (n_128));
  ASYNC_DFFHx1_ASAP7_75t_R \current_spiked_reg[13] (.RESET (grst), .SET
       (1'b0), .CLK (aclk), .D (n_124), .QN (current_spiked[13]));
  OAI21xp5_ASAP7_75t_R g3376__6083(.A1 (n_126), .A2 (n_125), .B
       (n_119), .Y (n_130));
  XNOR2xp5_ASAP7_75t_R g3380__2703(.A (n_122), .B (n_121), .Y (n_133));
  INVx1_ASAP7_75t_R g3381(.A (output_spikes[13]), .Y (n_124));
  OR2x2_ASAP7_75t_R g3382__5795(.A (current_spiked[13]), .B (n_122), .Y
       (output_spikes[13]));
  NAND2xp5_ASAP7_75t_R g3383__7344(.A (n_121), .B (n_122), .Y (n_125));
  NOR3xp33_ASAP7_75t_R g3384__1840(.A (n_120), .B (n_7), .C
       (current_spiked[13]), .Y (n_122));
  AOI221xp5_ASAP7_75t_R g3385__5019(.A1 (n_116), .A2
       (remaining_spikes_count[0]), .B1 (n_126), .B2
       (remaining_spikes_count[1]), .C (n_119), .Y (n_120));
  AOI21xp5_ASAP7_75t_R g3386__1857(.A1 (n_117), .A2 (n_118), .B
       (n_109), .Y (n_119));
  ASYNC_DFFHx1_ASAP7_75t_R \current_spiked_reg[12] (.RESET (grst), .SET
       (1'b0), .CLK (aclk), .D (n_115), .QN (current_spiked[12]));
  XNOR2xp5_ASAP7_75t_R g3387__9906(.A (n_118), .B (n_117), .Y (n_126));
  INVx1_ASAP7_75t_R g3389(.A (n_116), .Y (n_121));
  XNOR2xp5_ASAP7_75t_R g3390__8780(.A (n_113), .B (n_112), .Y (n_116));
  INVx1_ASAP7_75t_R g3391(.A (output_spikes[12]), .Y (n_115));
  OR2x2_ASAP7_75t_R g3392__4296(.A (current_spiked[12]), .B (n_113), .Y
       (output_spikes[12]));
  AND2x2_ASAP7_75t_R g3393__3772(.A (n_112), .B (n_113), .Y (n_117));
  NOR2xp33_ASAP7_75t_R g3394__1474(.A (current_spiked[12]), .B (n_111),
       .Y (n_113));
  NAND2xp5_ASAP7_75t_R g3395__4547(.A (input_spikes[12]), .B (n_110),
       .Y (n_111));
  OAI221xp5_ASAP7_75t_R g3396__9682(.A1 (n_112), .A2 (n_141), .B1
       (n_118), .B2 (n_91), .C (n_109), .Y (n_110));
  ASYNC_DFFHx1_ASAP7_75t_R \current_spiked_reg[11] (.RESET (grst), .SET
       (1'b0), .CLK (aclk), .D (n_106), .QN (current_spiked[11]));
  OAI21xp5_ASAP7_75t_R g3397__2683(.A1 (n_108), .A2 (n_107), .B
       (n_101), .Y (n_109));
  XOR2xp5_ASAP7_75t_R g3398__1309(.A (n_108), .B (n_107), .Y (n_118));
  XOR2xp5_ASAP7_75t_R g3400__6877(.A (n_104), .B (n_103), .Y (n_112));
  INVx1_ASAP7_75t_R g3401(.A (output_spikes[11]), .Y (n_106));
  OR2x2_ASAP7_75t_R g3402__2900(.A (current_spiked[11]), .B (n_104), .Y
       (output_spikes[11]));
  NAND2xp5_ASAP7_75t_R g3403__2391(.A (n_103), .B (n_104), .Y (n_107));
  NOR3xp33_ASAP7_75t_R g3404__7675(.A (n_102), .B (n_2), .C
       (current_spiked[11]), .Y (n_104));
  AOI221xp5_ASAP7_75t_R g3405__7118(.A1 (n_98), .A2
       (remaining_spikes_count[0]), .B1 (n_108), .B2
       (remaining_spikes_count[1]), .C (n_101), .Y (n_102));
  ASYNC_DFFHx1_ASAP7_75t_R \current_spiked_reg[10] (.RESET (grst), .SET
       (1'b0), .CLK (aclk), .D (n_97), .QN (current_spiked[10]));
  AOI21xp5_ASAP7_75t_R g3406__8757(.A1 (n_99), .A2 (n_100), .B (n_90),
       .Y (n_101));
  XNOR2xp5_ASAP7_75t_R g3407__1786(.A (n_100), .B (n_99), .Y (n_108));
  INVx1_ASAP7_75t_R g3409(.A (n_98), .Y (n_103));
  INVx1_ASAP7_75t_R g3411(.A (output_spikes[10]), .Y (n_97));
  XNOR2xp5_ASAP7_75t_R g3410__5953(.A (n_95), .B (n_94), .Y (n_98));
  OR2x2_ASAP7_75t_R g3412__5703(.A (current_spiked[10]), .B (n_95), .Y
       (output_spikes[10]));
  AND2x2_ASAP7_75t_R g3413__7114(.A (n_94), .B (n_95), .Y (n_99));
  NOR2xp33_ASAP7_75t_R g3414__5266(.A (current_spiked[10]), .B (n_93),
       .Y (n_95));
  NAND2xp5_ASAP7_75t_R g3415__2250(.A (input_spikes[10]), .B (n_92), .Y
       (n_93));
  OAI221xp5_ASAP7_75t_R g3416__6083(.A1 (n_94), .A2 (n_141), .B1
       (n_100), .B2 (n_91), .C (n_90), .Y (n_92));
  OAI21xp5_ASAP7_75t_R g3417__2703(.A1 (n_89), .A2 (n_88), .B (n_82),
       .Y (n_90));
  ASYNC_DFFHx1_ASAP7_75t_R \current_spiked_reg[9] (.RESET (grst), .SET
       (1'b0), .CLK (aclk), .D (n_87), .QN (current_spiked[9]));
  XOR2xp5_ASAP7_75t_R g3418__5795(.A (n_89), .B (n_88), .Y (n_100));
  XOR2xp5_ASAP7_75t_R g3420__7344(.A (n_85), .B (n_84), .Y (n_94));
  INVx1_ASAP7_75t_R g3421(.A (output_spikes[9]), .Y (n_87));
  OR2x2_ASAP7_75t_R g3422__1840(.A (current_spiked[9]), .B (n_85), .Y
       (output_spikes[9]));
  NAND2xp5_ASAP7_75t_R g3423__5019(.A (n_84), .B (n_85), .Y (n_88));
  NOR3xp33_ASAP7_75t_R g3424__1857(.A (n_83), .B (n_3), .C
       (current_spiked[9]), .Y (n_85));
  AOI221xp5_ASAP7_75t_R g3425__9906(.A1 (n_79), .A2
       (remaining_spikes_count[0]), .B1 (n_89), .B2
       (remaining_spikes_count[1]), .C (n_82), .Y (n_83));
  AOI21xp5_ASAP7_75t_R g3426__8780(.A1 (n_80), .A2 (n_81), .B (n_72),
       .Y (n_82));
  ASYNC_DFFHx1_ASAP7_75t_R \current_spiked_reg[8] (.RESET (grst), .SET
       (1'b0), .CLK (aclk), .D (n_78), .QN (current_spiked[8]));
  XNOR2xp5_ASAP7_75t_R g3427__4296(.A (n_81), .B (n_80), .Y (n_89));
  INVx1_ASAP7_75t_R g3429(.A (n_79), .Y (n_84));
  XNOR2xp5_ASAP7_75t_R g3430__3772(.A (n_76), .B (n_75), .Y (n_79));
  INVx1_ASAP7_75t_R g3431(.A (output_spikes[8]), .Y (n_78));
  OR2x2_ASAP7_75t_R g3432__1474(.A (current_spiked[8]), .B (n_76), .Y
       (output_spikes[8]));
  AND2x2_ASAP7_75t_R g3433__4547(.A (n_75), .B (n_76), .Y (n_80));
  NOR2xp33_ASAP7_75t_R g3434__9682(.A (current_spiked[8]), .B (n_74),
       .Y (n_76));
  NAND2xp5_ASAP7_75t_R g3435__2683(.A (input_spikes[8]), .B (n_73), .Y
       (n_74));
  OAI221xp5_ASAP7_75t_R g3436__1309(.A1 (n_75), .A2 (n_141), .B1
       (n_81), .B2 (n_91), .C (n_72), .Y (n_73));
  XOR2xp5_ASAP7_75t_R g3438__6877(.A (n_71), .B (n_70), .Y (n_81));
  ASYNC_DFFHx1_ASAP7_75t_R \current_spiked_reg[7] (.RESET (grst), .SET
       (1'b0), .CLK (aclk), .D (n_69), .QN (current_spiked[7]));
  OAI21xp5_ASAP7_75t_R g3437__2900(.A1 (n_71), .A2 (n_70), .B (n_64),
       .Y (n_72));
  XOR2xp5_ASAP7_75t_R g3440__2391(.A (n_67), .B (n_66), .Y (n_75));
  INVx1_ASAP7_75t_R g3441(.A (output_spikes[7]), .Y (n_69));
  OR2x2_ASAP7_75t_R g3442__7675(.A (current_spiked[7]), .B (n_67), .Y
       (output_spikes[7]));
  NAND2xp5_ASAP7_75t_R g3443__7118(.A (n_66), .B (n_67), .Y (n_70));
  NOR3xp33_ASAP7_75t_R g3444__8757(.A (n_65), .B (n_5), .C
       (current_spiked[7]), .Y (n_67));
  AOI221xp5_ASAP7_75t_R g3445__1786(.A1 (n_61), .A2
       (remaining_spikes_count[0]), .B1 (n_71), .B2
       (remaining_spikes_count[1]), .C (n_64), .Y (n_65));
  AOI21xp5_ASAP7_75t_R g3446__5953(.A1 (n_62), .A2 (n_63), .B (n_54),
       .Y (n_64));
  ASYNC_DFFHx1_ASAP7_75t_R \current_spiked_reg[6] (.RESET (grst), .SET
       (1'b0), .CLK (aclk), .D (n_60), .QN (current_spiked[6]));
  XNOR2xp5_ASAP7_75t_R g3447__5703(.A (n_63), .B (n_62), .Y (n_71));
  INVx1_ASAP7_75t_R g3449(.A (n_61), .Y (n_66));
  XNOR2xp5_ASAP7_75t_R g3450__7114(.A (n_58), .B (n_57), .Y (n_61));
  INVx1_ASAP7_75t_R g3451(.A (output_spikes[6]), .Y (n_60));
  OR2x2_ASAP7_75t_R g3452__5266(.A (current_spiked[6]), .B (n_58), .Y
       (output_spikes[6]));
  AND2x2_ASAP7_75t_R g3453__2250(.A (n_57), .B (n_58), .Y (n_62));
  NOR2xp33_ASAP7_75t_R g3454__6083(.A (current_spiked[6]), .B (n_56),
       .Y (n_58));
  NAND2xp5_ASAP7_75t_R g3455__2703(.A (input_spikes[6]), .B (n_55), .Y
       (n_56));
  OAI221xp5_ASAP7_75t_R g3456__5795(.A1 (n_57), .A2 (n_141), .B1
       (n_63), .B2 (n_91), .C (n_54), .Y (n_55));
  ASYNC_DFFHx1_ASAP7_75t_R \current_spiked_reg[5] (.RESET (grst), .SET
       (1'b0), .CLK (aclk), .D (n_51), .QN (current_spiked[5]));
  OAI21xp5_ASAP7_75t_R g3457__7344(.A1 (n_53), .A2 (n_52), .B (n_46),
       .Y (n_54));
  XOR2xp5_ASAP7_75t_R g3458__1840(.A (n_53), .B (n_52), .Y (n_63));
  XOR2xp5_ASAP7_75t_R g3460__5019(.A (n_49), .B (n_48), .Y (n_57));
  INVx1_ASAP7_75t_R g3461(.A (output_spikes[5]), .Y (n_51));
  OR2x2_ASAP7_75t_R g3462__1857(.A (current_spiked[5]), .B (n_49), .Y
       (output_spikes[5]));
  NAND2xp5_ASAP7_75t_R g3463__9906(.A (n_48), .B (n_49), .Y (n_52));
  NOR3xp33_ASAP7_75t_R g3464__8780(.A (n_47), .B (n_4), .C
       (current_spiked[5]), .Y (n_49));
  AOI221xp5_ASAP7_75t_R g3465__4296(.A1 (n_43), .A2
       (remaining_spikes_count[0]), .B1 (n_53), .B2
       (remaining_spikes_count[1]), .C (n_46), .Y (n_47));
  ASYNC_DFFHx1_ASAP7_75t_R \current_spiked_reg[4] (.RESET (grst), .SET
       (1'b0), .CLK (aclk), .D (n_42), .QN (current_spiked[4]));
  AOI21xp5_ASAP7_75t_R g3466__3772(.A1 (n_44), .A2 (n_45), .B (n_36),
       .Y (n_46));
  XNOR2xp5_ASAP7_75t_R g3467__1474(.A (n_45), .B (n_44), .Y (n_53));
  INVx1_ASAP7_75t_R g3469(.A (n_43), .Y (n_48));
  XNOR2xp5_ASAP7_75t_R g3470__4547(.A (n_40), .B (n_39), .Y (n_43));
  INVx1_ASAP7_75t_R g3471(.A (output_spikes[4]), .Y (n_42));
  OR2x2_ASAP7_75t_R g3472__9682(.A (current_spiked[4]), .B (n_40), .Y
       (output_spikes[4]));
  AND2x2_ASAP7_75t_R g3473__2683(.A (n_39), .B (n_40), .Y (n_44));
  NOR2xp33_ASAP7_75t_R g3474__1309(.A (current_spiked[4]), .B (n_38),
       .Y (n_40));
  NAND2xp5_ASAP7_75t_R g3475__6877(.A (input_spikes[4]), .B (n_37), .Y
       (n_38));
  OAI221xp5_ASAP7_75t_R g3476__2900(.A1 (n_39), .A2 (n_141), .B1
       (n_45), .B2 (n_91), .C (n_36), .Y (n_37));
  ASYNC_DFFHx1_ASAP7_75t_R \current_spiked_reg[3] (.RESET (grst), .SET
       (1'b0), .CLK (aclk), .D (n_33), .QN (current_spiked[3]));
  OAI21xp5_ASAP7_75t_R g3477__2391(.A1 (n_35), .A2 (n_34), .B
       (remaining_spikes_count[2]), .Y (n_36));
  XOR2xp5_ASAP7_75t_R g3478__7675(.A (n_35), .B (n_34), .Y (n_45));
  XOR2xp5_ASAP7_75t_R g3480__7118(.A (n_30), .B (n_31), .Y (n_39));
  INVx1_ASAP7_75t_R g3482(.A (output_spikes[3]), .Y (n_33));
  NAND2xp5_ASAP7_75t_R g3481__8757(.A (n_31), .B (n_30), .Y (n_34));
  OR2x2_ASAP7_75t_R g3483__1786(.A (current_spiked[3]), .B (n_30), .Y
       (output_spikes[3]));
  NOR2xp33_ASAP7_75t_R g3484__5953(.A (current_spiked[3]), .B (n_29),
       .Y (n_30));
  NAND2xp5_ASAP7_75t_R g3485__5703(.A (input_spikes[3]), .B (n_28), .Y
       (n_29));
  OAI22xp5_ASAP7_75t_R g3486__7114(.A1 (n_141), .A2 (n_31), .B1 (n_19),
       .B2 (n_27), .Y (n_28));
  NOR2xp33_ASAP7_75t_R g3487__5266(.A (remaining_spikes_count[2]), .B
       (n_35), .Y (n_27));
  ASYNC_DFFHx1_ASAP7_75t_R \current_spiked_reg[2] (.RESET (grst), .SET
       (1'b0), .CLK (aclk), .D (n_26), .QN (current_spiked[2]));
  AOI21xp5_ASAP7_75t_R g3489__2250(.A1 (n_24), .A2 (n_18), .B (n_20),
       .Y (n_35));
  INVx1_ASAP7_75t_R g3491(.A (output_spikes[2]), .Y (n_26));
  XNOR2xp5_ASAP7_75t_R g3490__6083(.A (n_24), .B (n_22), .Y (n_31));
  OR2x2_ASAP7_75t_R g3492__2703(.A (current_spiked[2]), .B (n_24), .Y
       (output_spikes[2]));
  NOR2xp33_ASAP7_75t_R g3493__5795(.A (current_spiked[2]), .B (n_23),
       .Y (n_24));
  A2O1A1Ixp33_ASAP7_75t_R g3494__7344(.A1 (remaining_spikes_count[0]),
       .A2 (n_22), .B (n_21), .C (input_spikes[2]), .Y (n_23));
  AOI21xp5_ASAP7_75t_R g3495__1840(.A1 (n_20), .A2 (n_1), .B (n_19), .Y
       (n_21));
  ASYNC_DFFHx1_ASAP7_75t_R \current_spiked_reg[1] (.RESET (grst), .SET
       (1'b0), .CLK (aclk), .D (n_17), .QN (current_spiked[1]));
  INVxp67_ASAP7_75t_R g3497(.A (n_22), .Y (n_18));
  XOR2xp5_ASAP7_75t_R g3498__5019(.A (n_10), .B (n_15), .Y (n_22));
  INVx1_ASAP7_75t_R g3499(.A (output_spikes[1]), .Y (n_17));
  OR2x2_ASAP7_75t_R g3500__1857(.A (current_spiked[1]), .B (n_15), .Y
       (output_spikes[1]));
  AND2x2_ASAP7_75t_R g3501__9906(.A (n_12), .B (n_15), .Y (n_20));
  ASYNC_DFFHx1_ASAP7_75t_R \current_spiked_reg[0] (.RESET (grst), .SET
       (1'b0), .CLK (aclk), .D (n_14), .QN (current_spiked[0]));
  NOR2xp33_ASAP7_75t_R g3502__8780(.A (current_spiked[1]), .B (n_11),
       .Y (n_15));
  INVx1_ASAP7_75t_R g3505(.A (output_spikes[0]), .Y (n_14));
  OR2x2_ASAP7_75t_R g3506__4296(.A (current_spiked[0]), .B (n_12), .Y
       (output_spikes[0]));
  OAI211xp5_ASAP7_75t_R g3503__3772(.A1 (n_8), .A2 (n_10), .B
       (input_spikes[1]), .C (n_9), .Y (n_11));
  INVxp67_ASAP7_75t_R g3507(.A (n_10), .Y (n_12));
  NAND3xp33_ASAP7_75t_R g3508__1474(.A (input_spikes[0]), .B (n_9), .C
       (n_0), .Y (n_10));
  NAND2xp5_ASAP7_75t_R g3509__4547(.A (n_141), .B (n_19), .Y (n_9));
  INVxp67_ASAP7_75t_R g3510(.A (n_19), .Y (n_8));
  NOR2xp33_ASAP7_75t_R g3511__9682(.A (remaining_spikes_count[2]), .B
       (remaining_spikes_count[1]), .Y (n_19));
  INVx1_ASAP7_75t_R g3520(.A (input_spikes[13]), .Y (n_7));
  INVx1_ASAP7_75t_R g3521(.A (input_spikes[14]), .Y (n_6));
  INVx1_ASAP7_75t_R g3517(.A (input_spikes[7]), .Y (n_5));
  INVx1_ASAP7_75t_R g3518(.A (input_spikes[5]), .Y (n_4));
  INVx1_ASAP7_75t_R g3519(.A (input_spikes[9]), .Y (n_3));
  INVx1_ASAP7_75t_R g3516(.A (input_spikes[11]), .Y (n_2));
  INVxp67_ASAP7_75t_R g3513(.A (remaining_spikes_count[2]), .Y (n_1));
  INVx1_ASAP7_75t_R g3512(.A (current_spiked[0]), .Y (n_0));
  INVx1_ASAP7_75t_R g3514(.A (remaining_spikes_count[1]), .Y (n_91));
  INVx1_ASAP7_75t_R g3515(.A (remaining_spikes_count[0]), .Y (n_141));
  MAJIxp5_ASAP7_75t_R g2(.A (n_141), .B (n_140), .C (n_150), .Y
       (n_176));
  NOR2xp33_ASAP7_75t_R g3364__3541(.A (n_141), .B (n_140), .Y (n_177));
  XOR2xp5_ASAP7_75t_R g3542(.A (n_128), .B (n_136), .Y (n_178));
endmodule

