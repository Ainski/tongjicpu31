`timescale 1ns / 1ps
module npcmaker(
    input  [31:0] imdt,    // ������չ���������
    input  [31:0] npc,     // ��ǰ���������ֵ
    input         Btype,   // ��ָ֧�����ͱ�־
    input         Ze,      // ALU���־���
    output [31:0] npc_out  // ��һ�����������ֵ
);

// �����֧Ŀ���ַ = ��ǰPC + (������ << 2)

// ����֧��������ʱѡ���֧Ŀ���ַ�����򱣳ֵ�ǰPC+4

    assign npc_out = (Ze && Btype) ?  npc + {imdt[29:0], 2'b00} : npc;


endmodule