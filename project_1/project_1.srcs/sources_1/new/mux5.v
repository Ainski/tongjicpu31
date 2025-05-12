`timescale 1ns / 1ps
module mux5(
    input wire [31:0] rt,
    input wire [31:0] rs,
    input wire [31:0] imdt,
    input wire [1:0] M5,
    output wire [31:0] a
);
    assign a = 
        (M5 == 2'b00)? rs :
        (M5 == 2'b01)? imdt :
        (M5 == 2'b10)? 32'b0 :
        rt;
endmodule