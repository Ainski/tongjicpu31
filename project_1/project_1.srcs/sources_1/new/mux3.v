module mux3(
    input [5:0] rtc,
    input [5:0] rdc,
    input [1:0] M3,
    output [5:0] mux3out
);
    assign mux3out =
    (!M3[1] & !M3[0] & rdc)|
    (!M3[1] &  M3[0] & 5'b11111)|
    ( M3[1] & !M3[0] & rtc);

endmodule