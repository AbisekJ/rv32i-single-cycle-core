module riscv_cpu(
    input clk, rst,
    output [31:0] PC,
    input  [31:0] Instr,
    output        MemWrite,
    output [31:0] Mem_WrAddr, Mem_WrData,
    input  [31:0] ReadData,
    output [31:0] Result);


  wire RegWrite, ALUSrcA;
  wire [1:0] ALUSrcB, PCSrc;
  wire [2:0] ImmSrc;
  wire [1:0] ResultSrc;
  wire [4:0] ALUControl;
  wire zero, nzero, lt, gt;
  wire is_m_instr;
  
 controller cp(Instr[6:0], Instr[14:12],Instr[31:25], zero, nzero, lt, gt, ResultSrc, MemWrite, ALUSrcA, 
                ALUSrcB, RegWrite, ImmSrc, PCSrc, ALUControl, is_m_instr);

 datapath dp(clk, rst, Instr, ReadData, RegWrite, ALUSrcA, ALUSrcB, PCSrc,ImmSrc, ResultSrc,ALUControl,is_m_instr,
             zero, nzero, lt, gt, PC, Mem_WrAddr, Mem_WrData, Result);
endmodule