`timescale 1ns/1ps
module pcreg(
    input pc_clk,
    input reset,           // 低电平有效复位
    input [31:0] mux1out,
    output [31:0] npc,
    output reg [31:0] pc,
    output [3:0] jpc
);

assign jpc = pc[31:28];  // 取PC高4位

// 异步复位，上升沿触发
always @(posedge pc_clk or posedge reset) begin
    if (reset) begin       // 复位时PC清零
        pc <= 32'b0;
    end else begin         // 正常工作时更新PC
        pc <= mux1out;
    end
end

assign npc = pc + 32'd4;  // 计算下一条指令地址

endmodule