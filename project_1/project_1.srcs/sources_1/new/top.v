module top(
    input clk,
    output [31:0] NPCout,
    output [31:0] a,
    output [31:0] b,
    output [31:0] DMEMdata,
    output [31:0] imdt,
    output [31:0] index,
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
    output [5:0] func,
    output [5:0] op,
    output [4:0] rdc,
    output [4:0] rsc,
    output [4:0] rtc,
    output [4:0] shamtT,
    output [3:0] aluc,
    output [3:0] jpc,
    output [16:0] imdtT,
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
    output reset,
    output su,
    output zero,
    output Ze
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

control control_inst(
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

indt_ext indt_ext_inst(
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

regfile regfile_inst(
    .RF_CLK(clk),
    .RF_RST(reset),
    .RF_W(RF_W),
    .mux3out(mux3out),
    .rd(rd),
    .rdd(rdd),
    .rsc(rsc),
    .rs(rs),
    .rtc(rtc),
    .rt(rt)
);

shamt_ext shamt_ext_inst(
    .shamt(shamt),
    .shamtT(shamtT)
);

endmodule