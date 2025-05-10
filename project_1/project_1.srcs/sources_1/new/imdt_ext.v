module imdt_ext(
    input [15:0] imdtT,
    input su,
    output [31:0] imdt
);
assign imdt = su ? {{16{imdtT[15]}}, imdtT} : {16'b0, imdtT};

endmodule