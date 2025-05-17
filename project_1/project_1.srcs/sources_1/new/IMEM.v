`timescale 1ns / 1ps
module IMEM(
    input [31:0] address,
    input IM_R,//read a intruction
    output reg [31:0] instr,
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
    wire [31:0]instrT;
    always @(*) begin
        instr=IM_R?instrT : 32'h0;
    end
    imem imem_ip(
        .a(address[12:2]),
        .spo(instrT)
    );
//    reg [31:0] IMEM [0:2047];
//    initial begin
//        // $readmemb("E:/github/cpu31/test_datas/_1_addi.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_1_addiu.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_1_lui.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_2_add.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_2_addu.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_2_and.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_2_andi.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_2_lwsw.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_2_lwsw2.txt", IMEM);
//       // $readmemb("E:/github/cpu31/test_datas/_2_nor.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_2_or.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_2_ori.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_2_sll.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_2_sllv.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_2_slt.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_2_slti.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_2_sltiu.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_2_sltu.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_2_sra.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_2_srav.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_2_srl.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_2_srlv.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_2_sub.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_2_subu.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_2_xor.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_2_xori.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_3.5_beq.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_3.5_bne.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_3_j.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_3_jal.txt", IMEM);
//        //$readmemb("E:/github/cpu31/test_datas/_4_jr.txt", IMEM);

//    end


endmodule