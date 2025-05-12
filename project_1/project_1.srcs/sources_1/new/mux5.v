`timescale 1ns / 1ps
module mux5(
    input wire [31:0] rt,
    input wire [31:0] rs,
    input wire [31:0] shamt,
    input wire [1:0] M5,
    output wire [31:0] a
);
    assign a = 
        (M5==2'b01)? shamt :
        (M5 == 2'b00)? rs :
        (M5 == 2'b10)? 32'b0 :
        (M5==2'b11)? rt:32'b0;
endmodule