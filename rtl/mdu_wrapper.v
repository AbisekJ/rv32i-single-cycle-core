module mdu_wrapper(
    input [31:0] rs1,
    input [31:0] rs2,
    input [2:0] funct3,
    output [31:0] m_result
);

wire signed [63:0] mul_out;
wire [31:0] div_quo, div_rem;


wire signed [31:0] mul_rs1 = (funct3==3'b010) ? $unsigned(rs1) : rs1;
wire signed [31:0] mul_rs2 = (funct3==3'b010)||(funct3==3'b011) ? $unsigned(rs2) : rs2; // MULHSU handles unsigned rs2

booth_mult mul_inst(
    .a(mul_rs1),
    .b(mul_rs2),
    .out(mul_out)
);

rest_div div_inst(
    .a(rs1),
    .b(rs2),
    .func3(funct3),
    .quo(div_quo),
    .rem(div_rem)
);

assign m_result = (funct3==3'b000) ? mul_out[31:0]       : // MUL
                  (funct3==3'b001) ? mul_out[63:32]      : // MULH
                  (funct3==3'b010) ? mul_out[63:32]      : // MULHSU
                  (funct3==3'b011) ? mul_out[63:32]      : // MULHU
                  (funct3==3'b100) ? div_quo             : // DIV
                  (funct3==3'b101) ? div_quo             : // DIVU
                  (funct3==3'b110) ? div_rem             : // REM
                  (funct3==3'b111) ? div_rem             : 32'b0;

endmodule