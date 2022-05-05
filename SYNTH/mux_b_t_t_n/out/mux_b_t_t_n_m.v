
// Generated by Cadence Genus(TM) Synthesis Solution 20.11-s111_1
// Generated on: Apr 26 2022 14:49:21 EDT (Apr 26 2022 18:49:21 UTC)

// Verification Directory fv/mux_b_t_t_n 

module mux_b_t_t_n(grst, aclk, \inputs[0] , \inputs[1] , \inputs[2] ,
     \inputs[3] , \inputs[4] , \inputs[5] , \inputs[6] , \inputs[7] ,
     \inputs[8] , \inputs[9] , \inputs[10] , \inputs[11] , \inputs[12]
     , \inputs[13] , \inputs[14] , \inputs[15] , select, \out[0] ,
     \out[1] , \out[2] , \out[3] , \out[4] , \out[5] , \out[6] ,
     \out[7] , \out[8] , \out[9] , \out[10] , \out[11] , \out[12] ,
     \out[13] , \out[14] , \out[15] );
  input grst, aclk, select;
  input [3:0] \inputs[0] , \inputs[1] , \inputs[2] , \inputs[3] ,
       \inputs[4] , \inputs[5] , \inputs[6] , \inputs[7] , \inputs[8] ,
       \inputs[9] , \inputs[10] , \inputs[11] , \inputs[12] ,
       \inputs[13] , \inputs[14] , \inputs[15] ;
  output [3:0] \out[0] , \out[1] , \out[2] , \out[3] , \out[4] ,
       \out[5] , \out[6] , \out[7] , \out[8] , \out[9] , \out[10] ,
       \out[11] , \out[12] , \out[13] , \out[14] , \out[15] ;
  wire grst, aclk, select;
  wire [3:0] \inputs[0] , \inputs[1] , \inputs[2] , \inputs[3] ,
       \inputs[4] , \inputs[5] , \inputs[6] , \inputs[7] , \inputs[8] ,
       \inputs[9] , \inputs[10] , \inputs[11] , \inputs[12] ,
       \inputs[13] , \inputs[14] , \inputs[15] ;
  wire [3:0] \out[0] , \out[1] , \out[2] , \out[3] , \out[4] , \out[5]
       , \out[6] , \out[7] , \out[8] , \out[9] , \out[10] , \out[11] ,
       \out[12] , \out[13] , \out[14] , \out[15] ;
  wire [3:0] counter;
  wire [3:0] select_value;
  wire n_0, n_3, n_6, n_7, n_9, n_10, n_11, n_12;
  wire n_13, n_14, n_15, n_16, n_17, n_18, n_19, n_20;
  wire n_21, n_22, n_23, n_24, n_25, n_26, n_27, n_28;
  wire n_29, n_30, n_31, n_32, n_33, n_34, n_35, n_36;
  wire n_37, n_38, n_39, n_40, n_41, n_42, n_43, n_44;
  wire n_45, n_46, n_47, n_48, n_49, n_50, n_51, n_52;
  wire n_53, n_54, n_55, n_56, n_57, n_58, n_59, n_60;
  wire n_61, n_62, n_63, n_64, n_65, n_66, n_67, n_68;
  wire n_69, n_70, n_71, n_72, n_73, n_74, n_75, n_76;
  wire n_79, n_83, n_88, n_92, n_97, n_101, n_106, n_110;
  wire n_114, n_120, n_126, n_131, n_137, n_142, n_148, n_152;
  wire n_224, n_225, n_226, n_227;
  AND2x2_ASAP7_75t_R g3016__2398(.A (\inputs[3] [2]), .B (n_137), .Y
       (\out[3] [2]));
  AND2x2_ASAP7_75t_R g2972__5107(.A (\inputs[0] [2]), .B (n_152), .Y
       (\out[0] [2]));
  AND2x2_ASAP7_75t_R g3020__6260(.A (\inputs[15] [1]), .B (n_79), .Y
       (\out[15] [1]));
  AND2x2_ASAP7_75t_R g2994__4319(.A (\inputs[0] [1]), .B (n_152), .Y
       (\out[0] [1]));
  AND2x2_ASAP7_75t_R g3002__8428(.A (\inputs[0] [0]), .B (n_152), .Y
       (\out[0] [0]));
  AND2x2_ASAP7_75t_R g3019__5526(.A (\inputs[1] [3]), .B (n_148), .Y
       (\out[1] [3]));
  AND2x2_ASAP7_75t_R g2973__6783(.A (\inputs[1] [2]), .B (n_148), .Y
       (\out[1] [2]));
  AND2x2_ASAP7_75t_R g2974__3680(.A (\inputs[1] [1]), .B (n_148), .Y
       (\out[1] [1]));
  AND2x2_ASAP7_75t_R g2975__1617(.A (\inputs[1] [0]), .B (n_148), .Y
       (\out[1] [0]));
  AND2x2_ASAP7_75t_R g2978__2802(.A (\inputs[2] [3]), .B (n_142), .Y
       (\out[2] [3]));
  AND2x2_ASAP7_75t_R g2999__1705(.A (\inputs[13] [1]), .B (n_88), .Y
       (\out[13] [1]));
  AND2x2_ASAP7_75t_R g3004__5122(.A (\inputs[2] [2]), .B (n_142), .Y
       (\out[2] [2]));
  AND2x2_ASAP7_75t_R g3005__8246(.A (\inputs[2] [1]), .B (n_142), .Y
       (\out[2] [1]));
  AND2x2_ASAP7_75t_R g3006__7098(.A (\inputs[2] [0]), .B (n_142), .Y
       (\out[2] [0]));
  AND2x2_ASAP7_75t_R g2993__6131(.A (\inputs[12] [1]), .B (n_92), .Y
       (\out[12] [1]));
  AND2x2_ASAP7_75t_R g3009__1881(.A (\inputs[3] [3]), .B (n_137), .Y
       (\out[3] [3]));
  AND2x2_ASAP7_75t_R g2987__5115(.A (\inputs[0] [3]), .B (n_152), .Y
       (\out[0] [3]));
  AND2x2_ASAP7_75t_R g3024__7482(.A (\inputs[3] [1]), .B (n_137), .Y
       (\out[3] [1]));
  AND2x2_ASAP7_75t_R g3025__4733(.A (\inputs[3] [0]), .B (n_137), .Y
       (\out[3] [0]));
  AND2x2_ASAP7_75t_R g3026__6161(.A (\inputs[4] [3]), .B (n_131), .Y
       (\out[4] [3]));
  AND2x2_ASAP7_75t_R g2976__9315(.A (\inputs[4] [2]), .B (n_131), .Y
       (\out[4] [2]));
  AND2x2_ASAP7_75t_R g2977__9945(.A (\inputs[4] [1]), .B (n_131), .Y
       (\out[4] [1]));
  AND2x2_ASAP7_75t_R g2979__2883(.A (\inputs[4] [0]), .B (n_131), .Y
       (\out[4] [0]));
  AND2x2_ASAP7_75t_R g2980__2346(.A (\inputs[5] [3]), .B (n_126), .Y
       (\out[5] [3]));
  AND2x2_ASAP7_75t_R g2985__1666(.A (\inputs[5] [2]), .B (n_126), .Y
       (\out[5] [2]));
  AND2x2_ASAP7_75t_R g2990__7410(.A (\inputs[5] [1]), .B (n_126), .Y
       (\out[5] [1]));
  AND2x2_ASAP7_75t_R g3032__6417(.A (\inputs[9] [1]), .B (n_106), .Y
       (\out[9] [1]));
  AND2x2_ASAP7_75t_R g2991__5477(.A (\inputs[5] [0]), .B (n_126), .Y
       (\out[5] [0]));
  AND2x2_ASAP7_75t_R g2995__2398(.A (\inputs[6] [3]), .B (n_120), .Y
       (\out[6] [3]));
  AND2x2_ASAP7_75t_R g3007__5107(.A (\inputs[6] [2]), .B (n_120), .Y
       (\out[6] [2]));
  AND2x2_ASAP7_75t_R g3028__6260(.A (\inputs[8] [1]), .B (n_110), .Y
       (\out[8] [1]));
  AND2x2_ASAP7_75t_R g3008__4319(.A (\inputs[6] [1]), .B (n_120), .Y
       (\out[6] [1]));
  AND2x2_ASAP7_75t_R g2986__8428(.A (\inputs[11] [2]), .B (n_97), .Y
       (\out[11] [2]));
  AND2x2_ASAP7_75t_R g3013__5526(.A (\inputs[7] [3]), .B (n_114), .Y
       (\out[7] [3]));
  AND2x2_ASAP7_75t_R g3017__6783(.A (\inputs[7] [2]), .B (n_114), .Y
       (\out[7] [2]));
  AND2x2_ASAP7_75t_R g3018__3680(.A (\inputs[7] [1]), .B (n_114), .Y
       (\out[7] [1]));
  AND2x2_ASAP7_75t_R g3022__1617(.A (\inputs[7] [0]), .B (n_114), .Y
       (\out[7] [0]));
  AND2x2_ASAP7_75t_R g3023__2802(.A (\inputs[8] [3]), .B (n_110), .Y
       (\out[8] [3]));
  AND2x2_ASAP7_75t_R g3027__1705(.A (\inputs[8] [2]), .B (n_110), .Y
       (\out[8] [2]));
  AND2x2_ASAP7_75t_R g3029__5122(.A (\inputs[8] [0]), .B (n_110), .Y
       (\out[8] [0]));
  AND2x2_ASAP7_75t_R g3030__8246(.A (\inputs[9] [3]), .B (n_106), .Y
       (\out[9] [3]));
  AND2x2_ASAP7_75t_R g3031__7098(.A (\inputs[9] [2]), .B (n_106), .Y
       (\out[9] [2]));
  AND2x2_ASAP7_75t_R g3033__6131(.A (\inputs[9] [0]), .B (n_106), .Y
       (\out[9] [0]));
  AND2x2_ASAP7_75t_R g3034__1881(.A (\inputs[10] [3]), .B (n_101), .Y
       (\out[10] [3]));
  AND2x2_ASAP7_75t_R g2981__5115(.A (\inputs[10] [2]), .B (n_101), .Y
       (\out[10] [2]));
  AND2x2_ASAP7_75t_R g2982__7482(.A (\inputs[10] [1]), .B (n_101), .Y
       (\out[10] [1]));
  AND2x2_ASAP7_75t_R g2983__4733(.A (\inputs[10] [0]), .B (n_101), .Y
       (\out[10] [0]));
  AND2x2_ASAP7_75t_R g2984__6161(.A (\inputs[11] [3]), .B (n_97), .Y
       (\out[11] [3]));
  AND2x2_ASAP7_75t_R g3010__9315(.A (\inputs[6] [0]), .B (n_120), .Y
       (\out[6] [0]));
  AND2x2_ASAP7_75t_R g2971__9945(.A (\inputs[11] [1]), .B (n_97), .Y
       (\out[11] [1]));
  AND2x2_ASAP7_75t_R g2988__2883(.A (\inputs[11] [0]), .B (n_97), .Y
       (\out[11] [0]));
  AND2x2_ASAP7_75t_R g2989__2346(.A (\inputs[12] [3]), .B (n_92), .Y
       (\out[12] [3]));
  AND2x2_ASAP7_75t_R g2992__1666(.A (\inputs[12] [2]), .B (n_92), .Y
       (\out[12] [2]));
  AND2x2_ASAP7_75t_R g2996__7410(.A (\inputs[12] [0]), .B (n_92), .Y
       (\out[12] [0]));
  AND2x2_ASAP7_75t_R g2997__6417(.A (\inputs[13] [3]), .B (n_88), .Y
       (\out[13] [3]));
  AND2x2_ASAP7_75t_R g2998__5477(.A (\inputs[13] [2]), .B (n_88), .Y
       (\out[13] [2]));
  AND2x2_ASAP7_75t_R g3000__2398(.A (\inputs[13] [0]), .B (n_88), .Y
       (\out[13] [0]));
  AND2x2_ASAP7_75t_R g3001__5107(.A (\inputs[14] [3]), .B (n_83), .Y
       (\out[14] [3]));
  AND2x2_ASAP7_75t_R g3011__6260(.A (\inputs[14] [2]), .B (n_83), .Y
       (\out[14] [2]));
  AND2x2_ASAP7_75t_R g3012__4319(.A (\inputs[14] [1]), .B (n_83), .Y
       (\out[14] [1]));
  AND2x2_ASAP7_75t_R g3014__8428(.A (\inputs[14] [0]), .B (n_83), .Y
       (\out[14] [0]));
  AND2x2_ASAP7_75t_R g3015__5526(.A (\inputs[15] [3]), .B (n_79), .Y
       (\out[15] [3]));
  AND2x2_ASAP7_75t_R g3003__6783(.A (\inputs[15] [2]), .B (n_79), .Y
       (\out[15] [2]));
  AND2x2_ASAP7_75t_R g3021__3680(.A (\inputs[15] [0]), .B (n_79), .Y
       (\out[15] [0]));
  NOR4xp25_ASAP7_75t_R g3035__1617(.A (n_19), .B (n_13), .C (n_35), .D
       (n_36), .Y (n_120));
  NOR4xp25_ASAP7_75t_R g3041__2802(.A (n_9), .B (n_51), .C (n_32), .D
       (n_76), .Y (n_83));
  NOR4xp25_ASAP7_75t_R g3038__1705(.A (n_31), .B (n_28), .C (n_25), .D
       (n_48), .Y (n_92));
  NOR4xp25_ASAP7_75t_R g3048__5122(.A (n_60), .B (n_59), .C (n_12), .D
       (n_15), .Y (n_106));
  NOR4xp25_ASAP7_75t_R g3047__8246(.A (n_71), .B (n_67), .C (n_21), .D
       (n_24), .Y (n_137));
  NOR4xp25_ASAP7_75t_R g3049__7098(.A (n_61), .B (n_58), .C (n_33), .D
       (n_11), .Y (n_131));
  NOR4xp25_ASAP7_75t_R g3042__6131(.A (n_69), .B (n_65), .C (n_14), .D
       (n_18), .Y (n_148));
  NOR4xp25_ASAP7_75t_R g3050__1881(.A (n_57), .B (n_56), .C (n_52), .D
       (n_55), .Y (n_101));
  NOR4xp25_ASAP7_75t_R g3045__5115(.A (n_74), .B (n_75), .C (n_29), .D
       (n_30), .Y (n_79));
  NOR4xp25_ASAP7_75t_R g3039__7482(.A (n_40), .B (n_34), .C (n_44), .D
       (n_46), .Y (n_126));
  NOR4xp25_ASAP7_75t_R g3037__4733(.A (n_37), .B (n_41), .C (n_39), .D
       (n_43), .Y (n_142));
  NOR4xp25_ASAP7_75t_R g3044__6161(.A (n_72), .B (n_70), .C (n_26), .D
       (n_27), .Y (n_114));
  NOR4xp25_ASAP7_75t_R g3043__9315(.A (n_64), .B (n_63), .C (n_20), .D
       (n_23), .Y (n_110));
  NOR4xp25_ASAP7_75t_R g3040__9945(.A (n_22), .B (n_16), .C (n_38), .D
       (n_45), .Y (n_88));
  NOR4xp25_ASAP7_75t_R g3046__2883(.A (n_47), .B (n_10), .C (n_54), .D
       (n_17), .Y (n_152));
  NOR4xp25_ASAP7_75t_R g3036__2346(.A (n_42), .B (n_53), .C (n_49), .D
       (n_50), .Y (n_97));
  XNOR2xp5_ASAP7_75t_R g3083__1666(.A (\inputs[14] [1]), .B (n_73), .Y
       (n_76));
  XNOR2xp5_ASAP7_75t_R g3068__7410(.A (\inputs[15] [2]), .B (n_68), .Y
       (n_75));
  XNOR2xp5_ASAP7_75t_R g3069__6417(.A (\inputs[15] [1]), .B (n_73), .Y
       (n_74));
  XNOR2xp5_ASAP7_75t_R g3070__5477(.A (\inputs[7] [0]), .B (n_66), .Y
       (n_72));
  XNOR2xp5_ASAP7_75t_R g3071__2398(.A (\inputs[3] [1]), .B (n_73), .Y
       (n_71));
  XNOR2xp5_ASAP7_75t_R g3072__5107(.A (\inputs[7] [1]), .B (n_73), .Y
       (n_70));
  XNOR2xp5_ASAP7_75t_R g3073__6260(.A (\inputs[1] [2]), .B (n_68), .Y
       (n_69));
  XNOR2xp5_ASAP7_75t_R g3074__4319(.A (\inputs[3] [0]), .B (n_66), .Y
       (n_67));
  XNOR2xp5_ASAP7_75t_R g3075__8428(.A (\inputs[1] [3]), .B (n_62), .Y
       (n_65));
  XNOR2xp5_ASAP7_75t_R g3076__5526(.A (\inputs[8] [0]), .B (n_66), .Y
       (n_64));
  XNOR2xp5_ASAP7_75t_R g3077__6783(.A (\inputs[8] [3]), .B (n_62), .Y
       (n_63));
  XNOR2xp5_ASAP7_75t_R g3078__3680(.A (\inputs[4] [1]), .B (n_73), .Y
       (n_61));
  XNOR2xp5_ASAP7_75t_R g3079__1617(.A (\inputs[9] [1]), .B (n_73), .Y
       (n_60));
  XNOR2xp5_ASAP7_75t_R g3080__2802(.A (\inputs[9] [0]), .B (n_66), .Y
       (n_59));
  XNOR2xp5_ASAP7_75t_R g3081__1705(.A (\inputs[4] [0]), .B (n_66), .Y
       (n_58));
  XNOR2xp5_ASAP7_75t_R g3082__5122(.A (\inputs[10] [3]), .B (n_62), .Y
       (n_57));
  XNOR2xp5_ASAP7_75t_R g3067__8246(.A (\inputs[10] [1]), .B (n_73), .Y
       (n_56));
  XNOR2xp5_ASAP7_75t_R g3084__7098(.A (\inputs[10] [0]), .B (n_66), .Y
       (n_55));
  XNOR2xp5_ASAP7_75t_R g3085__6131(.A (\inputs[0] [2]), .B (n_68), .Y
       (n_54));
  XNOR2xp5_ASAP7_75t_R g3055__1881(.A (\inputs[11] [2]), .B (n_68), .Y
       (n_53));
  XNOR2xp5_ASAP7_75t_R g3086__5115(.A (\inputs[10] [2]), .B (n_68), .Y
       (n_52));
  XNOR2xp5_ASAP7_75t_R g3051__7482(.A (\inputs[14] [0]), .B (n_66), .Y
       (n_51));
  XNOR2xp5_ASAP7_75t_R g3087__4733(.A (\inputs[11] [0]), .B (n_66), .Y
       (n_50));
  XNOR2xp5_ASAP7_75t_R g3088__6161(.A (\inputs[11] [1]), .B (n_73), .Y
       (n_49));
  XNOR2xp5_ASAP7_75t_R g3091__9315(.A (\inputs[12] [0]), .B (n_66), .Y
       (n_48));
  XNOR2xp5_ASAP7_75t_R g3052__9945(.A (\inputs[0] [3]), .B (n_62), .Y
       (n_47));
  XNOR2xp5_ASAP7_75t_R g3089__2883(.A (\inputs[5] [0]), .B (n_66), .Y
       (n_46));
  XNOR2xp5_ASAP7_75t_R g3094__2346(.A (\inputs[13] [0]), .B (n_66), .Y
       (n_45));
  XNOR2xp5_ASAP7_75t_R g3090__1666(.A (\inputs[5] [1]), .B (n_73), .Y
       (n_44));
  XNOR2xp5_ASAP7_75t_R g3093__7410(.A (\inputs[2] [0]), .B (n_66), .Y
       (n_43));
  XNOR2xp5_ASAP7_75t_R g3053__6417(.A (\inputs[11] [3]), .B (n_62), .Y
       (n_42));
  ASYNC_DFFHx1_ASAP7_75t_R \counter_reg[3] (.RESET (grst), .SET (1'b0),
       .CLK (aclk), .D (n_7), .QN (counter[3]));
  XNOR2xp5_ASAP7_75t_R g3060__5477(.A (\inputs[2] [1]), .B (n_73), .Y
       (n_41));
  XNOR2xp5_ASAP7_75t_R g3054__2398(.A (\inputs[5] [3]), .B (n_62), .Y
       (n_40));
  XNOR2xp5_ASAP7_75t_R g3095__5107(.A (\inputs[2] [3]), .B (n_62), .Y
       (n_39));
  XNOR2xp5_ASAP7_75t_R g3096__6260(.A (\inputs[13] [1]), .B (n_73), .Y
       (n_38));
  XNOR2xp5_ASAP7_75t_R g3056__4319(.A (\inputs[2] [2]), .B (n_68), .Y
       (n_37));
  XNOR2xp5_ASAP7_75t_R g3097__8428(.A (\inputs[6] [0]), .B (n_66), .Y
       (n_36));
  XNOR2xp5_ASAP7_75t_R g3098__5526(.A (\inputs[6] [1]), .B (n_73), .Y
       (n_35));
  XNOR2xp5_ASAP7_75t_R g3057__6783(.A (\inputs[5] [2]), .B (n_68), .Y
       (n_34));
  XNOR2xp5_ASAP7_75t_R g3099__3680(.A (\inputs[4] [3]), .B (n_62), .Y
       (n_33));
  XNOR2xp5_ASAP7_75t_R g3100__1617(.A (\inputs[14] [3]), .B (n_62), .Y
       (n_32));
  XNOR2xp5_ASAP7_75t_R g3058__2802(.A (\inputs[12] [2]), .B (n_68), .Y
       (n_31));
  XNOR2xp5_ASAP7_75t_R g3101__1705(.A (\inputs[15] [0]), .B (n_66), .Y
       (n_30));
  XNOR2xp5_ASAP7_75t_R g3102__5122(.A (\inputs[15] [3]), .B (n_62), .Y
       (n_29));
  XNOR2xp5_ASAP7_75t_R g3059__8246(.A (\inputs[12] [3]), .B (n_62), .Y
       (n_28));
  XNOR2xp5_ASAP7_75t_R g3103__7098(.A (\inputs[7] [2]), .B (n_68), .Y
       (n_27));
  XNOR2xp5_ASAP7_75t_R g3104__6131(.A (\inputs[7] [3]), .B (n_62), .Y
       (n_26));
  XNOR2xp5_ASAP7_75t_R g3092__1881(.A (\inputs[12] [1]), .B (n_73), .Y
       (n_25));
  XNOR2xp5_ASAP7_75t_R g3105__5115(.A (\inputs[3] [2]), .B (n_68), .Y
       (n_24));
  XNOR2xp5_ASAP7_75t_R g3106__7482(.A (\inputs[8] [1]), .B (n_73), .Y
       (n_23));
  XNOR2xp5_ASAP7_75t_R g3061__4733(.A (\inputs[13] [3]), .B (n_62), .Y
       (n_22));
  XNOR2xp5_ASAP7_75t_R g3107__6161(.A (\inputs[3] [3]), .B (n_62), .Y
       (n_21));
  XNOR2xp5_ASAP7_75t_R g3108__9315(.A (\inputs[8] [2]), .B (n_68), .Y
       (n_20));
  XNOR2xp5_ASAP7_75t_R g3062__9945(.A (\inputs[6] [2]), .B (n_68), .Y
       (n_19));
  XNOR2xp5_ASAP7_75t_R g3109__2883(.A (\inputs[1] [0]), .B (n_66), .Y
       (n_18));
  XNOR2xp5_ASAP7_75t_R g3110__2346(.A (\inputs[0] [1]), .B (n_73), .Y
       (n_17));
  XNOR2xp5_ASAP7_75t_R g3063__1666(.A (\inputs[13] [2]), .B (n_68), .Y
       (n_16));
  XNOR2xp5_ASAP7_75t_R g3111__7410(.A (\inputs[9] [2]), .B (n_68), .Y
       (n_15));
  XNOR2xp5_ASAP7_75t_R g3112__6417(.A (\inputs[1] [1]), .B (n_73), .Y
       (n_14));
  XNOR2xp5_ASAP7_75t_R g3064__5477(.A (\inputs[6] [3]), .B (n_62), .Y
       (n_13));
  XNOR2xp5_ASAP7_75t_R g3113__2398(.A (\inputs[9] [3]), .B (n_62), .Y
       (n_12));
  XNOR2xp5_ASAP7_75t_R g3114__5107(.A (\inputs[4] [2]), .B (n_68), .Y
       (n_11));
  XNOR2xp5_ASAP7_75t_R g3065__6260(.A (\inputs[0] [0]), .B (n_66), .Y
       (n_10));
  XNOR2xp5_ASAP7_75t_R g3066__4319(.A (\inputs[14] [2]), .B (n_68), .Y
       (n_9));
  ASYNC_DFFHx1_ASAP7_75t_R \select_value_reg[2] (.RESET (grst), .SET
       (1'b0), .CLK (aclk), .D (n_68), .QN (select_value[2]));
  ASYNC_DFFHx1_ASAP7_75t_R \counter_reg[2] (.RESET (grst), .SET (1'b0),
       .CLK (aclk), .D (n_224), .QN (counter[2]));
  ASYNC_DFFHx1_ASAP7_75t_R \select_value_reg[0] (.RESET (grst), .SET
       (1'b0), .CLK (aclk), .D (n_66), .QN (select_value[0]));
  ASYNC_DFFHx1_ASAP7_75t_R \select_value_reg[1] (.RESET (grst), .SET
       (1'b0), .CLK (aclk), .D (n_73), .QN (select_value[1]));
  ASYNC_DFFHx1_ASAP7_75t_R \select_value_reg[3] (.RESET (grst), .SET
       (1'b0), .CLK (aclk), .D (n_62), .QN (select_value[3]));
  XOR2xp5_ASAP7_75t_R g3125__8428(.A (counter[3]), .B (n_225), .Y
       (n_7));
  AOI21xp5_ASAP7_75t_R g3120__5526(.A1 (n_6), .A2 (counter[3]), .B
       (select_value[3]), .Y (n_62));
  AOI21xp5_ASAP7_75t_R g3121__6783(.A1 (n_6), .A2 (counter[2]), .B
       (select_value[2]), .Y (n_68));
  AOI21xp5_ASAP7_75t_R g3122__1617(.A1 (n_6), .A2 (counter[0]), .B
       (select_value[0]), .Y (n_66));
  AOI21xp5_ASAP7_75t_R g3119__2802(.A1 (n_6), .A2 (counter[1]), .B
       (select_value[1]), .Y (n_73));
  ASYNC_DFFHx1_ASAP7_75t_R \counter_reg[1] (.RESET (grst), .SET (1'b0),
       .CLK (aclk), .D (n_226), .QN (counter[1]));
  NOR5xp2_ASAP7_75t_R g3126__8246(.A (n_0), .B (select_value[3]), .C
       (select_value[0]), .D (select_value[1]), .E (select_value[2]),
       .Y (n_6));
  INVxp67_ASAP7_75t_R g3132(.A (n_227), .Y (n_3));
  ASYNC_DFFHx1_ASAP7_75t_R \counter_reg[0] (.RESET (grst), .SET (1'b0),
       .CLK (aclk), .D (counter[0]), .QN (counter[0]));
  INVx1_ASAP7_75t_R g3134(.A (select), .Y (n_0));
  HAxp5_ASAP7_75t_R g2(.A (counter[2]), .B (n_3), .CON (n_225), .SN
       (n_224));
  HAxp5_ASAP7_75t_R g3143(.A (counter[1]), .B (counter[0]), .CON
       (n_227), .SN (n_226));
endmodule

