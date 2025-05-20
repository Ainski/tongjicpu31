`timescale 1ns/1ps
module mux1 (
    input wire [31:0] jextend,
    input wire [31:0] NPCout,
    input wire [31:0] rs,
    input wire [1:0] M1,
    output reg [31:0] mux1out
);

always @(*) begin
    case (M1)
        2'b00: mux1out = NPCout;
        2'b01: mux1out = jextend;
        2'b10: mux1out = rs - 32'h00400000;
        default: mux1out = 32'b0;
    endcase
end

endmodule