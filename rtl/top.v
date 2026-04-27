module top(
       input clk, 
       input rst, 
       output MemWrite);
       
    wire [31:0] WriteData, DataAdr, ReadData, PC, Result, Instr;
    t1c_riscv_cpu t1c(clk, rst, 1'd0, 32'd0, 32'd0, MemWrite, WriteData, DataAdr, ReadData, PC, Result, Instr);
    
endmodule
