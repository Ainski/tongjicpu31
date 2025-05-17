`timescale 1ns / 1ps
module npcmaker(
    input  [31:0] imdt,    // 符号扩展后的立即数
    input  [31:0] npc,     // 当前程序计数器值
    input         Btype,   // 分支指令类型标志
    input         Ze,      // ALU零标志输出
    output [31:0] npc_out  // 下一个程序计数器值
);

// 计算分支目标地址 = 当前PC + (立即数 << 2)

// 当分支条件满足时选择分支目标地址，否则保持当前PC+4

    assign npc_out = (Ze && Btype) ?  npc + {imdt[29:0], 2'b00} : npc;


endmodule