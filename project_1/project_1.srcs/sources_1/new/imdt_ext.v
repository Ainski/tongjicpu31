module imdt_ext(
    input [15:0] imdtT,
    input su,
    output [31:0]imdt
);
//su为1作有符号扩展，su为0作无符号扩展
assign imdt = su? {24'b0, imdtT} : {24'b0, imdtT[7:0], 16'b0};
endmodule