`timescale 1ns / 1ps
module cpu(
    input clk,
    input reset,
    input [31:0] instr,
    inout [5:0] op,
    inout [4:0] rsc,
    inout [4:0] rtc,
    inout [4:0] rdc,
    inout [4:0] shamtT,
    inout [5:0] func,
    inout [15:0] imdtT,//immediate
    inout [25:0] index,
    inout [31:0] DMEMdata,
    output [31:0] NPCout,
    output [31:0] a,
    output [31:0] b,
    output [31:0] imdt,
    output [31:0] instr,
    output [31:0] jextend,
    output [31:0] mux3out,
    output [31:0] npc,
    output [31:0] pc,
    output [31:0] rd,
    output [31:0] rdd,
    output [31:0] r,
    output [31:0] rs,
    output [31:0] rt,
    output [31:0] shamt,
    output [3:0] aluc,
    output [3:0] jpc,
    output [1:0] M1,
    output [1:0] M2,
    output [1:0] M3,
    output [1:0] M4,
    output [1:0] M5,
    output Btype,
    output carry,
    output CS,
    output DM_R,
    output DM_W,
    output IM_R,
    output M6,
    output negative,
    output overflow,
    output RF_CLK,
    output RF_R,
    output RF_W,
    output su,
    output zero,
    output Ze,
    output [31:0] regfile0,regfile1,regfile2,regfile3,regfile4,regfile5,regfile6,regfile7,
    regfile8,regfile9,regfile10,regfile11,regfile12,regfile13,regfile14,regfile15,
    regfile16,regfile17,regfile18,regfile19,regfile20,regfile21,regfile22,regfile23,
    regfile24,regfile25,regfile26,regfile27,regfile28,regfile29,regfile30,regfile31
);

alu alu_inst(
    .a(a),
    .aluc(aluc),
    .b(b),
    .carry(carry),
    .negative(negative),
    .overflow(overflow),
    .r(r),
    .zero(zero)
);

controller controller_inst(
    .Btype(Btype),
    .DM_R(DM_R),
    .DM_W(DM_W),
    .IM_R(IM_R),
    .M1(M1),
    .M2(M2),
    .M3(M3),
    .M4(M4),
    .M5(M5),
    .M6(M6),
    .RF_W(RF_W),
    .aluc(aluc),
    .func(func),
    .op(op),
    .CS(CS),
    .su(su)
);

DMEM dmem_inst(
    .CS(CS),
    .DM_R(DM_R),
    .DM_W(DM_W),
    .DMEMaddr(r),
    .DMEMdata(DMEMdata),
    .clk(clk),
    .rt(rt)
);

imdt_ext imdt_ext_inst(
    .imdt(imdt),
    .imdtT(imdtT),
    .su(su)
);

IMEM imem_inst(
    .IM_R(IM_R),
    .address(pc),
    .func(func),
    .index(index),
    .instr(instr),
    .imdtT(imdtT),
    .op(op),
    .rdc(rdc),
    .rsc(rsc),
    .rtc(rtc),
    .shamtT(shamtT)
);

jextend jextend_inst(
    .index(index),
    .jextend(jextend),
    .jpc(jpc)
);

mux1 mux1_inst(
    .M1(M1),
    .NPCout(NPCout),
    .jextend(jextend),
    .mux1out(mux1out),
    .rs(rs)
);

mux3 mux3_inst(
    .M3(M3),
    .rdc(rdc),
    .rtc(rtc),
    .mux3out(mux3out)
);

mux4 mux4_inst(
    .M4(M4),
    .imdt(imdt),
    .rt(rt),
    .shamt(shamt),
    .b(b)
);

mux5 mux5_inst(
    .M5(M5),
    .imdt(imdt),
    .rt(rt),
    .rs(rs),
    .a(a)
);

mux6 mux6_inst(
    .M6(M6),
    .Ze(Ze),
    .zero(zero)
);

npcmaker npcmaker_inst(
    .Btype(Btype),
    .Ze(Ze),
    .imdt(imdt),
    .npc(npc),
    .npc_out(NPCout)
);

pcreg pc_inst(
    .jpc(jpc),
    .mux1out(mux1out),
    .npc(npc),
    .pc(pc),
    .pc_clk(clk),
    .reset(reset)
);

regfile cpu_ref(
    .RF_CLK(clk),
    .RF_RST(reset),
    .RF_W(RF_W),
    .mux3out(mux3out),
    .rd(rd),
    .rdd(rdd),
    .rsc(rsc),
    .rs(rs),
    .rtc(rtc),
    .rt(rt),
    .regfile0(regfile0),
    .regfile1(regfile1),
    .regfile2(regfile2),
    .regfile3(regfile3),
    .regfile4(regfile4),
    .regfile5(regfile5),
    .regfile6(regfile6),
    .regfile7(regfile7),
    .regfile8(regfile8),
    .regfile9(regfile9),
    .regfile10(regfile10),
    .regfile11(regfile11),
    .regfile12(regfile12),
    .regfile13(regfile13),
    .regfile14(regfile14),
    .regfile15(regfile15),
    .regfile16(regfile16),
    .regfile17(regfile17),
    .regfile18(regfile18),
    .regfile19(regfile19),
    .regfile20(regfile20),
    .regfile21(regfile21),
    .regfile22(regfile22),
    .regfile23(regfile23),
    .regfile24(regfile24),
    .regfile25(regfile25),
    .regfile26(regfile26),
    .regfile27(regfile27),
    .regfile28(regfile28),
    .regfile29(regfile29),
    .regfile30(regfile30),
    .regfile31(regfile31)
);

shamt_ext shamt_ext_inst(
    .shamt(shamt),
    .shamtT(shamtT)
);

mux2 mux2_inst(
    .M2(M2),
    .NPC(npc),
    .r(r),
    .dmemdata(DMEMdata),
    .rdd(rdd)
);  

endmodule