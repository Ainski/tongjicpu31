module pcreg(
    input pc_clk,
    input reset,
    input [31:0] mux1out,
    output [31:0] npc,

);
reg [31:0] pc;

always @(posedge pc_clk or posedge reset) begin
    if (reset) begin
        pc <= 0;
    end else begin
        pc <= mux1out;
    end
end

assign npc = pc + 1;

endmodule