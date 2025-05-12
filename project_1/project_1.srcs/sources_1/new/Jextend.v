`timescale 1ns / 1ps
module jextend(
    input [3:0]jpc,
    input [25:0] index,
    output [31:0] jextend
);
    assign jextend={jpc, index[25:21],1'b0,index[19:0],2'b0};
endmodule