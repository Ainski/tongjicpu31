`timescale 1ns / 1ps
module mux3(
    input [4:0] rtc,
    input [4:0] rdc,
    input [1:0] M3,
    output [4:0] mux3out
);
    assign mux3out = 
        (M3 == 2'b00) ? rdc :        // 选择rdc
        (M3 == 2'b01) ? 5'b11111 :   // 输出5位全1（修正位宽）
        (M3 == 2'b10) ? rtc :        // 选择rtc
        5'b0;                        // 默认情况（M3=11）输出0
endmodule