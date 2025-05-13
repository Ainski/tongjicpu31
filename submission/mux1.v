`timescale 1ns/1ps
module mux1 (
    input wire [31:0] jextend,
    input wire [31:0] NPCout,
    input wire [31:0] rs,
    input wire [1:0] M1,
    output [31:0] mux1out
);
//assign mux1out=
//    (NPCout     &   !M1[0]&!M1[1])|//00
//    (rs         &   M1[1]&!M1[0])|//10
//    (jextend    &   !M1[1]&M1[0]);//01

assign mux1out = 
    (M1 == 2'b00)? NPCout :
    (M1 == 2'b01)? jextend :
    (M1 == 2'b10)?rs-32'h00400000:32'b0;
endmodule