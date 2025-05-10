module mux5(
    input wire [31:0] rt,
    input wire [31:0] rs,
    input wire [31:0] imdt,
    input wire [1:0] M5,
    output wire [31:0] a
);

    assign a=
    (!M5[1]&!M5[0]&rs)|
    (!M5[1]&M5[0]&imdt)|
    (M5[1]&!M5[0]&32'b0)|
    (M5[1]&M5[0]&rt);

endmodule