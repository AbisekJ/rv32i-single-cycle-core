module not_gate(input i, ch1, ch2, ch3, output out);
wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14;

mux_2x1 u1(0, 1, i, w1);
mux_2x1 u2(0, 1, i, w2);
mux_2x1 u3(0, 1, i, w3);
mux_2x1 u4(0, 1, i, w4);
mux_2x1 u5(0, 1, i, w5);
mux_2x1 u6(0, 1, i, w6);
mux_2x1 u7(0, 1, i, w7);
mux_2x1 u8(0, 1, i, w8);

mux_2x1 u9(w1, w2, ch1, w9);
mux_2x1 u10(w3, w4, ch1, w10);
mux_2x1 u11(w5, w6, ch1, w11);
mux_2x1 u12(w7, w8, ch1, w12);

mux_2x1 u13(w9, w10, ch2, w13);
mux_2x1 u14(w11, w12, ch2, w14);

mux_2x1 u15(w13, w14, ch3, out);

endmodule