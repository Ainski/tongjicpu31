`timescale 1ns / 1ps
module mux4(
    input [31:0] rt,imdt,
    input M4,
    output [31:0] b);
    assign b = M4? imdt : rt;
endmodule