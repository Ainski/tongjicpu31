module top(
    input clk
)
wire PC_CLK;
wire mux1out;
wire reset;
wire [31:0] PC;
wire [31:0] NPC;

pcreg pc_inst(
   .clk(clk),
   .PC_CLK(PC_CLK),
   .reset(reset),
   .PC(PC),
   .NPC(NPC)
);
endmodule