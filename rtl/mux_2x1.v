module mux_2x1( input i1, i0, sel, output out);
assign out = sel? i1: i0;
endmodule