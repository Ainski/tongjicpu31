module mux3(
    input [4:0] rtc,
    input [4:0] rdc,
    input [1:0] M3,
    output [4:0] mux3out
);
    assign mux3out =
    (!M3[1] & !M3[0] & rdc)|
    (!M3[1] &  M3[0] & 4'b1111)|
    ( M3[1] & !M3[0] & rtc);

endmodule