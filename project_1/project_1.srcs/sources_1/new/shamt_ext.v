`timescale 1ns / 1ps
module shamt_ext(
    input [4:0] shamtT,
    output [31:0] shamt
);
    // ����չ����5λshamtT��չΪ32λ����27λ����
    assign shamt = {27'b0, shamtT};
endmodule