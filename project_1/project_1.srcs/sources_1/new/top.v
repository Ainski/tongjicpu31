`timescale 1ns / 1ps
module sccomp_dataflow(
    input clk_in,
    input reset,
    output [31:0] mux1out,
    output [31:0] NPCout,
    output [31:0] a,
    output [31:0] b,
    output [31:0] DMEMdata,
    output [31:0] imdt,
    output [25:0] index,
    output [31:0] inst,
    output [31:0] jextend,
    output [4:0] mux3out,
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
    output [15:0] imdtT,
    output [1:0] M1,
    output [1:0] M2,
    output [1:0] M3,
    output M4,
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

    output RF_W,
    output su,
    output zero,
    output Ze,
    output [31:0] regfile0,regfile1,regfile2,regfile3,regfile4,regfile5,regfile6,regfile7,
    regfile8,regfile9,regfile10,regfile11,regfile12,regfile13,regfile14,regfile15,
    regfile16,regfile17,regfile18,regfile19,regfile20,regfile21,regfile22,regfile23,
    regfile24,regfile25,regfile26,regfile27,regfile28,regfile29,regfile30,regfile31
);
wire [31:0]pc_temp;
assign pc=pc_temp+32'h00400000;
assign RF_CLK = clk_in;


wire [31:0] NPCout_t;
wire [31:0] a_t;
wire [31:0] b_t;
wire [31:0] DMEMdata_t;
wire [31:0] imdt_t;
wire [25:0] index_t;
wire [31:0] inst_t;
wire [31:0] jextend_t;
wire [4:0] mux3out_t;
wire [31:0] npc_t;
wire [31:0] rd_t;
wire [31:0] rdd_t;
wire [31:0] r_t;
wire [31:0] rs_t;
wire [31:0] rt_t;
wire [31:0] shamt_t;
wire [5:0] func_t;
wire [5:0] op_t;
wire [4:0] rdc_t;
wire [4:0] rsc_t;
wire [4:0] rtc_t;
wire [4:0] shamtT_t;
wire [3:0] aluc_t;
wire [3:0] jpc_t;
wire [15:0] imdtT_t;
wire [1:0] M1_t;
wire [1:0] M2_t;
wire [1:0] M3_t;
wire M4_t;
wire [1:0] M5_t;
wire Btype_t;
wire carry_t;
wire CS_t;
wire DM_R_t;
wire DM_W_t;
wire IM_R_t;
wire M6_t;
wire negative_t;
wire overflow_t;
wire RF_CLK_t;
wire RF_W_t;
wire su_t;
wire zero_t;
wire Ze_t;
wire [31:0] regfile0_t,regfile1_t,regfile2_t,regfile3_t,regfile4_t,regfile5_t,regfile6_t,regfile7_t,
            regfile8_t,regfile9_t,regfile10_t,regfile11_t,regfile12_t,regfile13_t,regfile14_t,regfile15_t,
            regfile16_t,regfile17_t,regfile18_t,regfile19_t,regfile20_t,regfile21_t,regfile22_t,regfile23_t,
            regfile24_t,regfile25_t,regfile26_t,regfile27_t,regfile28_t,regfile29_t,regfile30_t,regfile31_t;
wire [31:0]mux1out_t;
assign mux1out=mux1out_t;
assign NPCout = NPCout_t;
assign a = a_t;
assign b = b_t;
assign DMEMdata = DMEMdata_t;
assign imdt = imdt_t;
assign index = index_t;
assign inst = inst_t;
assign jextend = jextend_t;
assign mux3out = mux3out_t;
assign npc = npc_t;
assign rd = rd_t;
assign rdd = rdd_t;
assign r = r_t;
assign rs = rs_t;
assign rt = rt_t;
assign shamt = shamt_t;
assign func = func_t;
assign op = op_t;
assign rdc = rdc_t;
assign rsc = rsc_t;
assign rtc = rtc_t;
assign shamtT = shamtT_t;
assign aluc = aluc_t;
assign jpc = jpc_t;
assign imdtT = imdtT_t;
assign M1 = M1_t;
assign M2 = M2_t;
assign M3 = M3_t;
assign M4 = M4_t;
assign M5 = M5_t;
assign Btype = Btype_t;
assign carry = carry_t;
assign CS = CS_t;
assign DM_R = DM_R_t;
assign DM_W = DM_W_t;
assign IM_R = IM_R_t;
assign M6 = M6_t;
assign negative = negative_t;
assign overflow = overflow_t;
assign RF_CLK = RF_CLK_t;  // 注意：原代码中RF_CLK直接赋�?�为clk_in，此处需根据逻辑调整
assign RF_W = RF_W_t;
assign su = su_t;
assign zero = zero_t;
assign Ze = Ze_t;
assign regfile0 = regfile0_t;
assign regfile1 = regfile1_t;
assign regfile2 = regfile2_t;
assign regfile3 = regfile3_t;
assign regfile4 = regfile4_t;
assign regfile5 = regfile5_t;
assign regfile6 = regfile6_t;
assign regfile7 = regfile7_t;
assign regfile8 = regfile8_t;
assign regfile9 = regfile9_t;
assign regfile10 = regfile10_t;
assign regfile11 = regfile11_t;
assign regfile12 = regfile12_t;
assign regfile13 = regfile13_t;
assign regfile14 = regfile14_t;
assign regfile15 = regfile15_t;
assign regfile16 = regfile16_t;
assign regfile17 = regfile17_t;
assign regfile18 = regfile18_t;
assign regfile19 = regfile19_t;
assign regfile20 = regfile20_t;
assign regfile21 = regfile21_t;
assign regfile22 = regfile22_t;
assign regfile23 = regfile23_t;
assign regfile24 = regfile24_t;
assign regfile25 = regfile25_t;
assign regfile26 = regfile26_t;
assign regfile27 = regfile27_t;
assign regfile28 = regfile28_t;
assign regfile29 = regfile29_t;
assign regfile30 = regfile30_t;
assign regfile31 = regfile31_t;
cpu sccpu(
        .clk(clk_in),
        .NPCout(NPCout_t),
        .a(a_t),
        .b(b_t),
        .mux1out(mux1out_t),
        .DMEMdata(DMEMdata_t),
        .imdt(imdt_t),
        .index(index_t),
        .instr(inst_t),
        .jextend(jextend_t),
        .mux3out(mux3out_t),
        .npc(npc_t),
        .pc(pc_temp),
        .rd(rd_t),
        .rdd(rdd_t),
        .r(r_t),
        .rs(rs_t),
        .rt(rt_t),
        .shamt(shamt_t),
        .func(func_t),
        .op(op_t),
        .rdc(rdc_t),
        .rsc(rsc_t),
        .rtc(rtc_t),
        .shamtT(shamtT_t),
        .aluc(aluc_t),
        .jpc(jpc_t),
        .imdtT(imdtT_t),
        .M1(M1_t),
        .M2(M2_t),
        .M3(M3_t),
        .M4(M4_t),
        .M5(M5_t),
        .Btype(Btype_t),
        .carry(carry_t),
        .CS(CS_t),
        .DM_R(DM_R_t),
        .DM_W(DM_W_t),
        .IM_R(IM_R_t),
        .M6(M6_t),
        .negative(negative_t),
        .overflow(overflow_t),
        .RF_CLK(RF_CLK_t),
        .RF_W(RF_W_t),
        .reset(reset),
        .su(su_t),
        .zero(zero_t),
        .Ze(Ze_t),
        .regfile0(regfile0_t),
        .regfile1(regfile1_t),
        .regfile2(regfile2_t),
        .regfile3(regfile3_t),
        .regfile4(regfile4_t),
        .regfile5(regfile5_t),
        .regfile6(regfile6_t),
        .regfile7(regfile7_t),
        .regfile8(regfile8_t),
        .regfile9(regfile9_t),
        .regfile10(regfile10_t),
        .regfile11(regfile11_t),
        .regfile12(regfile12_t),
        .regfile13(regfile13_t),
        .regfile14(regfile14_t),
        .regfile15(regfile15_t),
        .regfile16(regfile16_t),
        .regfile17(regfile17_t),
        .regfile18(regfile18_t),
        .regfile19(regfile19_t),
        .regfile20(regfile20_t),
        .regfile21(regfile21_t),
        .regfile22(regfile22_t),
        .regfile23(regfile23_t),
        .regfile24(regfile24_t),
        .regfile25(regfile25_t),
        .regfile26(regfile26_t),
        .regfile27(regfile27_t),
        .regfile28(regfile28_t),
        .regfile29(regfile29_t),
        .regfile30(regfile30_t),
        .regfile31(regfile31_t)
);
DMEM dmem_inst(
    .CS(CS_t),
    .DM_R(DM_R_t),
    .DM_W(DM_W_t),
    .DMEMaddr(r_t),
    .DMEMdata(DMEMdata_t),
    .clk(clk_in),
    .rt(rt_t)
);
IMEM imem_inst(
    .IM_R(IM_R_t),
    .address(pc_temp),
    .func(func_t),
    .index(index_t),
    .instr(inst_t),
    .imdtT(imdtT_t),
    .op(op_t),
    .rdc(rdc_t),
    .rsc(rsc_t),
    .rtc(rtc_t),
    .shamtT(shamtT_t)
);


endmodule