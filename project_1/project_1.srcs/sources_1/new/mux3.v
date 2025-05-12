`timescale 1ns / 1ps
module mux3(
    input [4:0] rtc,
    input [4:0] rdc,
    input [1:0] M3,
    output [4:0] mux3out
);
    assign mux3out = 
        (M3 == 2'b00) ? rdc :        // ѡ��rdc
        (M3 == 2'b01) ? 5'b11111 :   // ���5λȫ1������λ��
        (M3 == 2'b10) ? rtc :        // ѡ��rtc
        5'b0;                        // Ĭ�������M3=11�����0
endmodule