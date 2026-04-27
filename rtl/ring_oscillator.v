
module ring_oscillator(
    input  clk,   // system clock for ILA only
    input rst,   // for d-ff primitive only
    input  en,
    input  ch1,
    input  ch2,
    input  ch3,
    output reg [32:0] pack_reg);
    
reg ro_sync1, ro_sync2;
wire out;

    // Internal wires
    (* KEEP="true", DONT_TOUCH="true" *) wire [299:0] t;
    (* KEEP="true", DONT_TOUCH="true" *) wire en1,en2,en3,en4,en5,en6,en7,en8;
    (* KEEP="true", DONT_TOUCH="true" *) wire o1,o2,o3,o4,o5,o6,o7,o8;
    (* KEEP="true", DONT_TOUCH="true" *) wire q1,q2,q3,q4,q5,q6,q7,q8;

    // Enable AND gates
    and (en1, en, o1);
    and (en2, en, o2);
    and (en3, en, o3);
    and (en4, en, o4);
    and (en5, en, o5);
    and (en6, en, o6);
    and (en7, en, o7);
    and (en8, en, o8);

    // ============================================================
    // RING 1 → 9 NOT gates
    // ============================================================
    not_gate r1_0 (en1, ch1, ch2, ch3, t[0]);
    not_gate r1_1 (t[0], ch1, ch2, ch3, t[1]);
    not_gate r1_2 (t[1], ch1, ch2, ch3, t[2]);
    not_gate r1_3 (t[2], ch1, ch2, ch3, t[3]);
    not_gate r1_4 (t[3], ch1, ch2, ch3, t[4]);
    not_gate r1_5 (t[4], ch1, ch2, ch3, t[5]);
    not_gate r1_6 (t[5], ch1, ch2, ch3, t[6]);
    not_gate r1_7 (t[6], ch1, ch2, ch3, t[7]);
    not_gate r1_8 (t[7], ch1, ch2, ch3, o1);

    // ============================================================
    // RING 2 → 15 NOT gates
    // ============================================================
    not_gate r2_0 (en2, ch1, ch2, ch3, t[8]);
    not_gate r2_1 (t[8], ch1, ch2, ch3, t[9]);
    not_gate r2_2 (t[9], ch1, ch2, ch3, t[10]);
    not_gate r2_3 (t[10], ch1, ch2, ch3, t[11]);
    not_gate r2_4 (t[11], ch1, ch2, ch3, t[12]);
    not_gate r2_5 (t[12], ch1, ch2, ch3, t[13]);
    not_gate r2_6 (t[13], ch1, ch2, ch3, t[14]);
    not_gate r2_7 (t[14], ch1, ch2, ch3, t[15]);
    not_gate r2_8 (t[15], ch1, ch2, ch3, t[16]);
    not_gate r2_9 (t[16], ch1, ch2, ch3, t[17]);
    not_gate r2_10(t[17], ch1, ch2, ch3, t[18]);
    not_gate r2_11(t[18], ch1, ch2, ch3, t[19]);
    not_gate r2_12(t[19], ch1, ch2, ch3, t[20]);
    not_gate r2_13(t[20], ch1, ch2, ch3, t[21]);
    not_gate r2_14(t[21], ch1, ch2, ch3, o2);

    // ============================================================
    // RING 3 → 21 NOT gates
    // ============================================================
    not_gate r3_0 (en3, ch1, ch2, ch3, t[22]);
    not_gate r3_1 (t[22], ch1, ch2, ch3, t[23]);
    not_gate r3_2 (t[23], ch1, ch2, ch3, t[24]);
    not_gate r3_3 (t[24], ch1, ch2, ch3, t[25]);
    not_gate r3_4 (t[25], ch1, ch2, ch3, t[26]);
    not_gate r3_5 (t[26], ch1, ch2, ch3, t[27]);
    not_gate r3_6 (t[27], ch1, ch2, ch3, t[28]);
    not_gate r3_7 (t[28], ch1, ch2, ch3, t[29]);
    not_gate r3_8 (t[29], ch1, ch2, ch3, t[30]);
    not_gate r3_9 (t[30], ch1, ch2, ch3, t[31]);
    not_gate r3_10(t[31], ch1, ch2, ch3, t[32]);
    not_gate r3_11(t[32], ch1, ch2, ch3, t[33]);
    not_gate r3_12(t[33], ch1, ch2, ch3, t[34]);
    not_gate r3_13(t[34], ch1, ch2, ch3, t[35]);
    not_gate r3_14(t[35], ch1, ch2, ch3, t[36]);
    not_gate r3_15(t[36], ch1, ch2, ch3, t[37]);
    not_gate r3_16(t[37], ch1, ch2, ch3, t[38]);
    not_gate r3_17(t[38], ch1, ch2, ch3, t[39]);
    not_gate r3_18(t[39], ch1, ch2, ch3, t[40]);
    not_gate r3_19(t[40], ch1, ch2, ch3, t[41]);
    not_gate r3_20(t[41], ch1, ch2, ch3, o3);

    // ============================================================
    // RING 4 → 25 NOT gates
    // ============================================================
    not_gate r4_0  (en4, ch1, ch2, ch3, t[42]);
    not_gate r4_1  (t[42], ch1, ch2, ch3, t[43]);
    not_gate r4_2  (t[43], ch1, ch2, ch3, t[44]);
    not_gate r4_3  (t[44], ch1, ch2, ch3, t[45]);
    not_gate r4_4  (t[45], ch1, ch2, ch3, t[46]);
    not_gate r4_5  (t[46], ch1, ch2, ch3, t[47]);
    not_gate r4_6  (t[47], ch1, ch2, ch3, t[48]);
    not_gate r4_7  (t[48], ch1, ch2, ch3, t[49]);
    not_gate r4_8  (t[49], ch1, ch2, ch3, t[50]);
    not_gate r4_9  (t[50], ch1, ch2, ch3, t[51]);
    not_gate r4_10 (t[51], ch1, ch2, ch3, t[52]);
    not_gate r4_11 (t[52], ch1, ch2, ch3, t[53]);
    not_gate r4_12 (t[53], ch1, ch2, ch3, t[54]);
    not_gate r4_13 (t[54], ch1, ch2, ch3, t[55]);
    not_gate r4_14 (t[55], ch1, ch2, ch3, t[56]);
    not_gate r4_15 (t[56], ch1, ch2, ch3, t[57]);
    not_gate r4_16 (t[57], ch1, ch2, ch3, t[58]);
    not_gate r4_17 (t[58], ch1, ch2, ch3, t[59]);
    not_gate r4_18 (t[59], ch1, ch2, ch3, t[60]);
    not_gate r4_19 (t[60], ch1, ch2, ch3, t[61]);
    not_gate r4_20 (t[61], ch1, ch2, ch3, t[62]);
    not_gate r4_21 (t[62], ch1, ch2, ch3, t[63]);
    not_gate r4_22 (t[63], ch1, ch2, ch3, t[64]);
    not_gate r4_23 (t[64], ch1, ch2, ch3, t[65]);
    not_gate r4_24 (t[65], ch1, ch2, ch3, o4);
    // ============================================================
    // RING 5 → 27 NOT gates
    // ============================================================
    not_gate r5_0  (en5, ch1, ch2, ch3, t[66]);
    not_gate r5_1  (t[66], ch1, ch2, ch3, t[67]);
    not_gate r5_2  (t[67], ch1, ch2, ch3, t[68]);
    not_gate r5_3  (t[68], ch1, ch2, ch3, t[69]);
    not_gate r5_4  (t[69], ch1, ch2, ch3, t[70]);
    not_gate r5_5  (t[70], ch1, ch2, ch3, t[71]);
    not_gate r5_6  (t[71], ch1, ch2, ch3, t[72]);
    not_gate r5_7  (t[72], ch1, ch2, ch3, t[73]);
    not_gate r5_8  (t[73], ch1, ch2, ch3, t[74]);
    not_gate r5_9  (t[74], ch1, ch2, ch3, t[75]);
    not_gate r5_10 (t[75], ch1, ch2, ch3, t[76]);
    not_gate r5_11 (t[76], ch1, ch2, ch3, t[77]);
    not_gate r5_12 (t[77], ch1, ch2, ch3, t[78]);
    not_gate r5_13 (t[78], ch1, ch2, ch3, t[79]);
    not_gate r5_14 (t[79], ch1, ch2, ch3, t[80]);
    not_gate r5_15 (t[80], ch1, ch2, ch3, t[81]);
    not_gate r5_16 (t[81], ch1, ch2, ch3, t[82]);
    not_gate r5_17 (t[82], ch1, ch2, ch3, t[83]);
    not_gate r5_18 (t[83], ch1, ch2, ch3, t[84]);
    not_gate r5_19 (t[84], ch1, ch2, ch3, t[85]);
    not_gate r5_20 (t[85], ch1, ch2, ch3, t[86]);
    not_gate r5_21 (t[86], ch1, ch2, ch3, t[87]);
    not_gate r5_22 (t[87], ch1, ch2, ch3, t[88]);
    not_gate r5_23 (t[88], ch1, ch2, ch3, t[89]);
    not_gate r5_24 (t[89], ch1, ch2, ch3, t[90]);
    not_gate r5_25 (t[90], ch1, ch2, ch3, t[91]);
    not_gate r5_26 (t[91], ch1, ch2, ch3, o5);
    // ============================================================
    // RING 6 → 33 NOT gates
    // ============================================================
    not_gate r6_0  (en6, ch1, ch2, ch3, t[92]);
    not_gate r6_1  (t[92], ch1, ch2, ch3, t[93]);
    not_gate r6_2  (t[93], ch1, ch2, ch3, t[94]);
    not_gate r6_3  (t[94], ch1, ch2, ch3, t[95]);
    not_gate r6_4  (t[95], ch1, ch2, ch3, t[96]);
    not_gate r6_5  (t[96], ch1, ch2, ch3, t[97]);
    not_gate r6_6  (t[97], ch1, ch2, ch3, t[98]);
    not_gate r6_7  (t[98], ch1, ch2, ch3, t[99]);
    not_gate r6_8  (t[99], ch1, ch2, ch3, t[100]);
    not_gate r6_9  (t[100], ch1, ch2, ch3, t[101]);
    not_gate r6_10 (t[101], ch1, ch2, ch3, t[102]);
    not_gate r6_11 (t[102], ch1, ch2, ch3, t[103]);
    not_gate r6_12 (t[103], ch1, ch2, ch3, t[104]);
    not_gate r6_13 (t[104], ch1, ch2, ch3, t[105]);
    not_gate r6_14 (t[105], ch1, ch2, ch3, t[106]);
    not_gate r6_15 (t[106], ch1, ch2, ch3, t[107]);
    not_gate r6_16 (t[107], ch1, ch2, ch3, t[108]);
    not_gate r6_17 (t[108], ch1, ch2, ch3, t[109]);
    not_gate r6_18 (t[109], ch1, ch2, ch3, t[110]);
    not_gate r6_19 (t[110], ch1, ch2, ch3, t[111]);
    not_gate r6_20 (t[111], ch1, ch2, ch3, t[112]);
    not_gate r6_21 (t[112], ch1, ch2, ch3, t[113]);
    not_gate r6_22 (t[113], ch1, ch2, ch3, t[114]);
    not_gate r6_23 (t[114], ch1, ch2, ch3, t[115]);
    not_gate r6_24 (t[115], ch1, ch2, ch3, t[116]);
    not_gate r6_25 (t[116], ch1, ch2, ch3, t[117]);
    not_gate r6_26 (t[117], ch1, ch2, ch3, t[118]);
    not_gate r6_27 (t[118], ch1, ch2, ch3, t[119]);
    not_gate r6_28 (t[119], ch1, ch2, ch3, t[120]);
    not_gate r6_29 (t[120], ch1, ch2, ch3, t[121]);
    not_gate r6_30 (t[121], ch1, ch2, ch3, t[122]);
    not_gate r6_31 (t[122], ch1, ch2, ch3, t[123]);
    not_gate r6_32 (t[123], ch1, ch2, ch3, o6);
    // ============================================================
    // RING 7 → 35 NOT gates
    // ============================================================
    not_gate r7_0  (en7, ch1, ch2, ch3, t[124]);
    not_gate r7_1  (t[124], ch1, ch2, ch3, t[125]);
    not_gate r7_2  (t[125], ch1, ch2, ch3, t[126]);
    not_gate r7_3  (t[126], ch1, ch2, ch3, t[127]);
    not_gate r7_4  (t[127], ch1, ch2, ch3, t[128]);
    not_gate r7_5  (t[128], ch1, ch2, ch3, t[129]);
    not_gate r7_6  (t[129], ch1, ch2, ch3, t[130]);
    not_gate r7_7  (t[130], ch1, ch2, ch3, t[131]);
    not_gate r7_8  (t[131], ch1, ch2, ch3, t[132]);
    not_gate r7_9  (t[132], ch1, ch2, ch3, t[133]);
    not_gate r7_10 (t[133], ch1, ch2, ch3, t[134]);
    not_gate r7_11 (t[134], ch1, ch2, ch3, t[135]);
    not_gate r7_12 (t[135], ch1, ch2, ch3, t[136]);
    not_gate r7_13 (t[136], ch1, ch2, ch3, t[137]);
    not_gate r7_14 (t[137], ch1, ch2, ch3, t[138]);
    not_gate r7_15 (t[138], ch1, ch2, ch3, t[139]);
    not_gate r7_16 (t[139], ch1, ch2, ch3, t[140]);
    not_gate r7_17 (t[140], ch1, ch2, ch3, t[141]);
    not_gate r7_18 (t[141], ch1, ch2, ch3, t[142]);
    not_gate r7_19 (t[142], ch1, ch2, ch3, t[143]);
    not_gate r7_20 (t[143], ch1, ch2, ch3, t[144]);
    not_gate r7_21 (t[144], ch1, ch2, ch3, t[145]);
    not_gate r7_22 (t[145], ch1, ch2, ch3, t[146]);
    not_gate r7_23 (t[146], ch1, ch2, ch3, t[147]);
    not_gate r7_24 (t[147], ch1, ch2, ch3, t[148]);
    not_gate r7_25 (t[148], ch1, ch2, ch3, t[149]);
    not_gate r7_26 (t[149], ch1, ch2, ch3, t[150]);
    not_gate r7_27 (t[150], ch1, ch2, ch3, t[151]);
    not_gate r7_28 (t[151], ch1, ch2, ch3, t[152]);
    not_gate r7_29 (t[152], ch1, ch2, ch3, t[153]);
    not_gate r7_30 (t[153], ch1, ch2, ch3, t[154]);
    not_gate r7_31 (t[154], ch1, ch2, ch3, t[155]);
    not_gate r7_32 (t[155], ch1, ch2, ch3, t[156]);
    not_gate r7_33 (t[156], ch1, ch2, ch3, t[157]);
    not_gate r7_34 (t[157], ch1, ch2, ch3, o7);
    // ============================================================
    // RING 8 → 45 NOT gates
    // ============================================================
    not_gate r8_0  (en8, ch1, ch2, ch3, t[158]);
    not_gate r8_1  (t[158], ch1, ch2, ch3, t[159]);
    not_gate r8_2  (t[159], ch1, ch2, ch3, t[160]);
    not_gate r8_3  (t[160], ch1, ch2, ch3, t[161]);
    not_gate r8_4  (t[161], ch1, ch2, ch3, t[162]);
    not_gate r8_5  (t[162], ch1, ch2, ch3, t[163]);
    not_gate r8_6  (t[163], ch1, ch2, ch3, t[164]);
    not_gate r8_7  (t[164], ch1, ch2, ch3, t[165]);
    not_gate r8_8  (t[165], ch1, ch2, ch3, t[166]);
    not_gate r8_9  (t[166], ch1, ch2, ch3, t[167]);
    not_gate r8_10 (t[167], ch1, ch2, ch3, t[168]);
    not_gate r8_11 (t[168], ch1, ch2, ch3, t[169]);
    not_gate r8_12 (t[169], ch1, ch2, ch3, t[170]);
    not_gate r8_13 (t[170], ch1, ch2, ch3, t[171]);
    not_gate r8_14 (t[171], ch1, ch2, ch3, t[172]);
    not_gate r8_15 (t[172], ch1, ch2, ch3, t[173]);
    not_gate r8_16 (t[173], ch1, ch2, ch3, t[174]);
    not_gate r8_17 (t[174], ch1, ch2, ch3, t[175]);
    not_gate r8_18 (t[175], ch1, ch2, ch3, t[176]);
    not_gate r8_19 (t[176], ch1, ch2, ch3, t[177]);
    not_gate r8_20 (t[177], ch1, ch2, ch3, t[178]);
    not_gate r8_21 (t[178], ch1, ch2, ch3, t[179]);
    not_gate r8_22 (t[179], ch1, ch2, ch3, t[180]);
    not_gate r8_23 (t[180], ch1, ch2, ch3, t[181]);
    not_gate r8_24 (t[181], ch1, ch2, ch3, t[182]);
    not_gate r8_25 (t[182], ch1, ch2, ch3, t[183]);
    not_gate r8_26 (t[183], ch1, ch2, ch3, t[184]);
    not_gate r8_27 (t[184], ch1, ch2, ch3, t[185]);
    not_gate r8_28 (t[185], ch1, ch2, ch3, t[186]);
    not_gate r8_29 (t[186], ch1, ch2, ch3, t[187]);
    not_gate r8_30 (t[187], ch1, ch2, ch3, t[188]);
    not_gate r8_31 (t[188], ch1, ch2, ch3, t[189]);
    not_gate r8_32 (t[189], ch1, ch2, ch3, t[190]);
    not_gate r8_33 (t[190], ch1, ch2, ch3, t[191]);
    not_gate r8_34 (t[191], ch1, ch2, ch3, t[192]);
    not_gate r8_35 (t[192], ch1, ch2, ch3, t[193]);
    not_gate r8_36 (t[193], ch1, ch2, ch3, t[194]);
    not_gate r8_37 (t[194], ch1, ch2, ch3, t[195]);
    not_gate r8_38 (t[195], ch1, ch2, ch3, t[196]);
    not_gate r8_39 (t[196], ch1, ch2, ch3, t[197]);
    not_gate r8_40 (t[197], ch1, ch2, ch3, t[198]);
    not_gate r8_41 (t[198], ch1, ch2, ch3, t[199]);
    not_gate r8_42 (t[199], ch1, ch2, ch3, t[200]);
    not_gate r8_43 (t[200], ch1, ch2, ch3, t[201]);
    not_gate r8_44 (t[201], ch1, ch2, ch3, o8);
      
    
    FDRE dff1 (
    .C  (clk),   // Clock
    .CE (en),    // Clock Enable (1 = allow clock)
    .R  (rst),   // Synchronous Reset (active-high)
    .D  (o1),     // Data input
    .Q  (q1)      // Data output
);

FDRE dff2 (
    .C  (clk),   // Clock
    .CE (en),    // Clock Enable (1 = allow clock)
    .R  (rst),   // Synchronous Reset (active-high)
    .D  (o2),     // Data input
    .Q  (q2)      // Data output
);

FDRE dff3 (
    .C  (clk),   // Clock
    .CE (en),    // Clock Enable (1 = allow clock)
    .R  (rst),   // Synchronous Reset (active-high)
    .D  (o3),     // Data input
    .Q  (q3)      // Data output
);

FDRE dff4 (
    .C  (clk),   // Clock
    .CE (en),    // Clock Enable (1 = allow clock)
    .R  (rst),   // Synchronous Reset (active-high)
    .D  (o4),     // Data input
    .Q  (q4)      // Data output
); 

FDRE dff5 (
    .C  (clk),   // Clock
    .CE (en),    // Clock Enable (1 = allow clock)
    .R  (rst),   // Synchronous Reset (active-high)
    .D  (o5),     // Data input
    .Q  (q5)      // Data output
);

FDRE dff6 (
    .C  (clk),   // Clock
    .CE (en),    // Clock Enable (1 = allow clock)
    .R  (rst),   // Synchronous Reset (active-high)
    .D  (o6),     // Data input
    .Q  (q6)      // Data output
);

FDRE dff7 (
    .C  (clk),   // Clock
    .CE (en),    // Clock Enable (1 = allow clock)
    .R  (rst),   // Synchronous Reset (active-high)
    .D  (o7),     // Data input
    .Q  (q7)      // Data output
);

FDRE dff8 (
    .C  (clk),   // Clock
    .CE (en),    // Clock Enable (1 = allow clock)
    .R  (rst),   // Synchronous Reset (active-high)
    .D  (o8),     // Data input
    .Q  (q8)      // Data output
);

assign  out = q1^q2^q3^q4^q5^q6^q7^q8;


always @(posedge clk) begin // synchronize the out
    ro_sync1 <= out;
    ro_sync2 <= ro_sync1;
end

always @(posedge clk) begin  // packet conversion
    if (rst) pack_reg  <= 32'd0;
    else pack_reg <= {pack_reg[30:0], ro_sync2};
end

 
 
endmodule



   

