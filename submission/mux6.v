`timescale 1ns / 1ps
module mux6(
    input zero,
    input M6,
    output Ze
);
assign Ze = !(zero ^ M6);
endmodule