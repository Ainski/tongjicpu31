module jextend(
    input [3:0]jpc,
    input [25:0] index,
    output [31:0] jextend
);
    assign jextend={jpc, index,2'b0};
endmodule