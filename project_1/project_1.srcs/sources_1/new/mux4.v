`timescale 1ns / 1ps
module mux4(
    input [31:0] rt,shamt,imdt,
    input [1:0] M4,
    output [31:0] b);
    assign b = (M4 == 2'b00)? rt : (M4 == 2'b01)? shamt : (M4 == 2'b10)? imdt : 32'b0;
endmodule