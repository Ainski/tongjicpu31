`timescale 1ns/1ps
module pcreg(
    input pc_clk,
    input reset,           // �͵�ƽ��Ч��λ
    input [31:0] mux1out,
    output [31:0] npc,
    output reg [31:0] pc,
    output [3:0] jpc
);

assign jpc = pc[31:28];  // ȡPC��4λ

// �첽��λ�������ش���
always @(posedge pc_clk or posedge reset) begin
    if (reset) begin       // ��λʱPC����
        pc <= 32'b0;
    end else begin         // ��������ʱ����PC
        pc <= mux1out;
    end
end

assign npc = pc + 32'd4;  // ������һ��ָ���ַ

endmodule