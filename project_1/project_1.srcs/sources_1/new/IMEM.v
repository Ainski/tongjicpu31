`timescale 1ns / 1ps
module IMEM(
    input [31:0] address,
    input IM_R,//read a intruction
    output [31:0] instr,
    output [5:0] op,
    output [4:0] rsc,
    output [4:0] rtc,
    output [4:0] rdc,
    output [4:0] shamtT,
    output [5:0] func,
    output [15:0] imdtT,//immediate
    output [25:0] index

);
    assign op=instr[31:26];
    assign rsc=instr[25:21];
    assign rtc=instr[20:16];
    assign rdc=instr[15:11];
    assign shamtT=instr[10:6];
    assign func=instr[5:0];
    assign imdtT=instr[15:0];
    assign index=instr[25:0];

    reg [31:0] IMEM [0:2047];
    initial begin
        $readmemb("_1_addi.txt", IMEM);
        // $readmemb("_1_addiu.txt", IMEM);
        // $readmemb("_1_lui.txt", IMEM);
        // $readmemb("_2_add.txt", IMEM);
        // $readmemb("_2_addu.txt", IMEM);
        // $readmemb("_2_and.txt", IMEM);
        // $readmemb("_2_andi.txt", IMEM);
        // $readmemb("_2_lwsw.txt", IMEM);
        // $readmemb("_2_lwsw2.txt", IMEM);
        // $readmemb("_2_nor.txt", IMEM);
        // $readmemb("_2_or.txt", IMEM);
        // $readmemb("_2_ori.txt", IMEM);
        // $readmemb("_2_sll.txt", IMEM);
        // $readmemb("_2_sllv.txt", IMEM);
        // $readmemb("_2_slt.txt", IMEM);
        // $readmemb("_2_slti.txt", IMEM);
        // $readmemb("_2_sltiu.txt", IMEM);
        // $readmemb("_2_sltu.txt", IMEM);
        // $readmemb("_2_sra.txt", IMEM);
        // $readmemb("_2_srav.txt", IMEM);
        // $readmemb("_2_srl.txt", IMEM);
        // $readmemb("_2_srlv.txt", IMEM);
        // $readmemb("_2_sub.txt", IMEM);
        // $readmemb("_2_subu.txt", IMEM);
        // $readmemb("_2_xor.txt", IMEM);
        // $readmemb("_2_xori.txt", IMEM);
        // $readmemb("_3.5_beq.txt", IMEM);
        // $readmemb("_3.5_bne.txt", IMEM);
        // $readmemb("_3_j.txt", IMEM);
        // $readmemb("_3_jal.txt", IMEM);
        // $readmemb("_4_jr.txt", IMEM);

    end
    assign instr=IMEM[address[12:2]] & IM_R;

endmodule