module datapath (
    input clk, rst,
    input [31:0] Instr, ReadData, 
    input RegWrite, ALUSrcA,  
    input [1:0] ALUSrcB, PCSrc, 
    input [2:0] ImmSrc,
	input [1:0] ResultSrc,
    input [4:0] ALUControl,
    input is_m_instr,
    output zero, nzero, lt, gt,
    output [31:0]PC,
    output [31:0] Mem_WrAddr, Mem_WrData, Result);

  wire [31:0] ALUResult;
  wire [31:0] RD1, RD2, SrcB, SrcA;
  wire [31:0] ImmExt;
  wire [31:0] PCPlus4, PCTarget, PC_out;
  wire [31:0] m_result;
  wire [31:0] Op_Result;
  //wire Branch, Jump;
  
//next pc logic
    adder add1(PC, 32'd4, PCPlus4);
    adder add2(PC, ImmExt, PCTarget);
    mux3 #(32) pc_mux(PCPlus4, PCTarget, ALUResult, PCSrc, PC_out);
    reset_ff #(32) pcreg(clk, rst, PC_out, PC);
      
    // reg file logic
    // reg_file reg_mem(clk, rst, RegWrite, Instr[19:15], Instr[24:20], Instr[11:7], Result, RD1, RD2);
    reg_file rf (clk, RegWrite, Instr[19:15], Instr[24:20], Instr[11:7], Result, RD1, RD2);
    ImmExt ext(Instr[31:7], ImmSrc, ImmExt);
        
// ALU logic
    mux3 #(32) muxB(RD2, ImmExt, 32'd4, ALUSrcB, SrcB);
    mux2 #(32) muxA(RD1, PC, ALUSrcA, SrcA);
    alu_unit alu(SrcA, SrcB, ALUControl, ALUResult, zero, nzero, lt, gt);
    mdu_wrapper MDU(SrcA, SrcB, Instr[14:12], m_result);
    mux2 #(32) mux_IvsM(ALUResult, m_result, is_m_instr, Op_Result);
    mux4 #(32) result_mux(Op_Result, ReadData, PCPlus4, ImmExt, ResultSrc, Result);
    
    assign Mem_WrData = RD2;
    assign Mem_WrAddr = Op_Result;
    
endmodule