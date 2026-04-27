module trng_block #(parameter integer NUM = 8)(
    input  clk,
    input  rst,
    input  trng_en,
    input  ch1,
    input  ch2,
    input  ch3,
    output done
);

wire [32:0] out [0:NUM-1];

genvar i;
generate
    for (i = 0; i < NUM; i = i + 1) begin : trng_inst
        ring_oscillator ro (
            .clk(clk),
            .rst(rst),
            .en(trng_en),
            .ch1(ch1),
            .ch2(ch2),
            .ch3(ch3),
            .out(out[i])
        );
    end
endgenerate

assign done = trng_en; 

endmodule
