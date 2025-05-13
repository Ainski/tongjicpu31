`timescale 1ns/1ps
module pcreg(
    input pc_clk,
    input reset,
    input [31:0] mux1out,
    output [31:0] npc,
    output reg [31:0] pc,
    output [3:0] jpc

);

assign jpc =pc[31:28];
always @(posedge reset) begin
    if (reset) begin
        pc <= 0;
    end
end
always @(negedge pc_clk) begin
    if (!reset) begin
        pc <= mux1out;
    end
end

assign npc = pc + 4;

endmodule