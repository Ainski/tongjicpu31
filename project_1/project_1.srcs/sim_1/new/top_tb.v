`timescale 1ns / 1ps

module _246tb_ex9_tb;

	// Inputs
	reg clk_in;
	reg reset;

	// Outputs
	wire [31:0] inst;
	wire [31:0] pc;
	    // 声明输入输出信号
        wire RF_W;
        wire IM_R;
        wire [1:0] M1;
        wire [1:0] M2;
        wire [1:0] M3;
        wire [1:0] M4;
        wire [1:0] M5;
        wire M6;
        wire [3:0] aluc;
        wire [3:0] jpc;
        wire [4:0] rdc;
        wire [4:0] rsc;
        wire [4:0] rtc;
        wire [4:0] shamtT;
        wire [5:0] func;
        wire [5:0] op;
        wire [15:0] imdtT;
        wire [31:0] rdd;
        wire Btype;
        wire su;
        wire DM_R;
        wire DM_W;
        wire CS;
        wire overflow;
        wire negative;
        wire Ze;
        wire carry;
        wire zero;
    
        // 声明输出信号
        wire [31:0] NPCout;
        wire [31:0] a;
        wire [31:0] b;
        wire [31:0] DMEMdata;
        wire [31:0] imdt;
        wire [25:0] index;
        wire [31:0] jextend;
        wire [4:0] mux3out;
        wire [31:0] npc;
        wire [31:0] rd;
        wire [31:0] r;
        wire [31:0] rs;
        wire [31:0] rt;
        wire [31:0] shamt;
        wire RF_CLK;
        wire [31:0] regfile0,regfile1,regfile2,regfile3,regfile4,regfile5,regfile6,regfile7,
        regfile8,regfile9,regfile10,regfile11,regfile12,regfile13,regfile14,regfile15,
        regfile16,regfile17,regfile18,regfile19,regfile20,regfile21,regfile22,regfile23,
        regfile24,regfile25,regfile26,regfile27,regfile28,regfile29,regfile30,regfile31;
	// Instantiate the Unit Under Test (UUT)
	sccomp_dataflow uut (
		.clk_in(clk_in), 
		.reset(reset), 
		.inst(inst),
		.pc(pc),
                .NPCout(NPCout),
                .a(a),
                .b(b),
                .DMEMdata(DMEMdata),
                .imdt(imdt),
                .index(index),
                .jextend(jextend),
                .mux3out(mux3out),
                .npc(npc),
                .rd(rd),
                .rdd(rdd),
                .r(r),
                .rs(rs),
                .rt(rt),
                .shamt(shamt),
                .func(func),
                .op(op),
                .rdc(rdc),
                .rsc(rsc),
                .rtc(rtc),
                .shamtT(shamtT),
                .aluc(aluc),
                .jpc(jpc),
                .imdtT(imdtT),
                .M1(M1),
                .M2(M2),
                .M3(M3),
                .M4(M4),
                .M5(M5),
                .Btype(Btype),
                .carry(carry),
                .CS(CS),
                .DM_R(DM_R),
                .DM_W(DM_W),
                .IM_R(IM_R),
                .M6(M6),
                .negative(negative),
                .overflow(overflow),
                .RF_CLK(RF_CLK),
                .RF_W(RF_W),

                .su(su),
                .zero(zero),
                .Ze(Ze),
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

	integer file_output;
	
	
initial begin
		
		file_output = $fopen("_246tb_ex9_result.txt");	
		// Initialize Inputs
		clk_in = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#50;
        reset = 0;		
		// Add stimulus here
		
		//#100;
		//$fclose(file_output);
	end
   
	always begin		
	if(pc==32'hxxxxxxxx)begin
	   $finish;
	end
	#50;	
	clk_in = ~clk_in;
	if(clk_in == 1'b1) begin	
			$fdisplay(file_output, "pc: %h", pc);	
			$fdisplay(file_output, "instr: %h", inst);
			$fdisplay(file_output, "regfile0: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[0]);
			$fdisplay(file_output, "regfile1: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[1]);
			$fdisplay(file_output, "regfile2: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[2]);
			$fdisplay(file_output, "regfile3: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[3]);
			$fdisplay(file_output, "regfile4: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[4]);
			$fdisplay(file_output, "regfile5: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[5]);
			$fdisplay(file_output, "regfile6: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[6]);
			$fdisplay(file_output, "regfile7: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[7]);
			$fdisplay(file_output, "regfile8: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[8]);
			$fdisplay(file_output, "regfile9: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[9]);
			$fdisplay(file_output, "regfile10: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[10]);
			$fdisplay(file_output, "regfile11: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[11]);
			$fdisplay(file_output, "regfile12: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[12]);
			$fdisplay(file_output, "regfile13: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[13]);
			$fdisplay(file_output, "regfile14: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[14]);
			$fdisplay(file_output, "regfile15: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[15]);
			$fdisplay(file_output, "regfile16: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[16]);
			$fdisplay(file_output, "regfile17: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[17]);
			$fdisplay(file_output, "regfile18: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[18]);
			$fdisplay(file_output, "regfile19: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[19]);
			$fdisplay(file_output, "regfile20: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[20]);
			$fdisplay(file_output, "regfile21: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[21]);
			$fdisplay(file_output, "regfile22: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[22]);
			$fdisplay(file_output, "regfile23: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[23]);
			$fdisplay(file_output, "regfile24: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[24]);
			$fdisplay(file_output, "regfile25: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[25]);
			$fdisplay(file_output, "regfile26: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[26]);
			$fdisplay(file_output, "regfile27: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[27]);
			$fdisplay(file_output, "regfile28: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[28]);
			$fdisplay(file_output, "regfile29: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[29]);
			$fdisplay(file_output, "regfile30: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[30]);
			$fdisplay(file_output, "regfile31: %h", _246tb_ex9_tb.uut.sccpu.cpu_ref.array_reg[31]);
		end
	end
endmodule


//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 2025/05/11 14:03:47
//// Design Name: 
//// Module Name: top_tb
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////



//module top_tb;
//    // 声明输入输出信号
//    reg clk;
//    reg reset;
//    wire RF_W;
//    wire IM_R;
//    wire [1:0] M1;
//    wire [1:0] M2;
//    wire [1:0] M3;
//    wire [1:0] M4;
//    wire [1:0] M5;
//    wire M6;
//    wire [3:0] aluc;
//    wire [3:0] jpc;
//    wire [4:0] rdc;
//    wire [4:0] rsc;
//    wire [4:0] rtc;
//    wire [4:0] shamtT;
//    wire [5:0] func;
//    wire [5:0] op;
//    wire [15:0] imdtT;
//    wire [31:0] rdd;
//    wire Btype;
//    wire su;
//    wire DM_R;
//    wire DM_W;
//    wire CS;
//    wire overflow;
//    wire negative;
//    wire Ze;
//    wire carry;
//    wire zero;

//    // 声明输出信号
//    wire [31:0] NPCout;
//    wire [31:0] a;
//    wire [31:0] b;
//    wire [31:0] DMEMdata;
//    wire [31:0] imdt;
//    wire [25:0] index;
//    wire [31:0] instr;
//    wire [31:0] jextend;
//    wire [4:0] mux3out;
//    wire [31:0] npc;
//    wire [31:0] pc;
//    wire [31:0] rd;
//    wire [31:0] r;
//    wire [31:0] rs;
//    wire [31:0] rt;
//    wire [31:0] shamt;
//    wire RF_CLK;
//    wire [31:0] regfile0,regfile1,regfile2,regfile3,regfile4,regfile5,regfile6,regfile7,
//    regfile8,regfile9,regfile10,regfile11,regfile12,regfile13,regfile14,regfile15,
//    regfile16,regfile17,regfile18,regfile19,regfile20,regfile21,regfile22,regfile23,
//    regfile24,regfile25,regfile26,regfile27,regfile28,regfile29,regfile30,regfile31;
//    // 实例化top模块
//    top top_inst (
//        .clk(clk),
//        .NPCout(NPCout),
//        .a(a),
//        .b(b),
//        .DMEMdata(DMEMdata),
//        .imdt(imdt),
//        .index(index),
//        .instr(instr),
//        .jextend(jextend),
//        .mux3out(mux3out),
//        .npc(npc),
//        .pc(pc),
//        .rd(rd),
//        .rdd(rdd),
//        .r(r),
//        .rs(rs),
//        .rt(rt),
//        .shamt(shamt),
//        .func(func),
//        .op(op),
//        .rdc(rdc),
//        .rsc(rsc),
//        .rtc(rtc),
//        .shamtT(shamtT),
//        .aluc(aluc),
//        .jpc(jpc),
//        .imdtT(imdtT),
//        .M1(M1),
//        .M2(M2),
//        .M3(M3),
//        .M4(M4),
//        .M5(M5),
//        .Btype(Btype),
//        .carry(carry),
//        .CS(CS),
//        .DM_R(DM_R),
//        .DM_W(DM_W),
//        .IM_R(IM_R),
//        .M6(M6),
//        .negative(negative),
//        .overflow(overflow),
//        .RF_CLK(RF_CLK),
//        .RF_W(RF_W),
//        .reset(reset),
//        .su(su),
//        .zero(zero),
//        .Ze(Ze),
//        .regfile0(regfile0),
//        .regfile1(regfile1),
//        .regfile2(regfile2),
//        .regfile3(regfile3),
//        .regfile4(regfile4),
//        .regfile5(regfile5),
//        .regfile6(regfile6),
//        .regfile7(regfile7),
//        .regfile8(regfile8),
//        .regfile9(regfile9),
//        .regfile10(regfile10),
//        .regfile11(regfile11),
//        .regfile12(regfile12),
//        .regfile13(regfile13),
//        .regfile14(regfile14),
//        .regfile15(regfile15),
//        .regfile16(regfile16),
//        .regfile17(regfile17),
//        .regfile18(regfile18),
//        .regfile19(regfile19),
//        .regfile20(regfile20),
//        .regfile21(regfile21),
//        .regfile22(regfile22),
//        .regfile23(regfile23),
//        .regfile24(regfile24),
//        .regfile25(regfile25),
//        .regfile26(regfile26),
//        .regfile27(regfile27),
//        .regfile28(regfile28),
//        .regfile29(regfile29),
//        .regfile30(regfile30),
//        .regfile31(regfile31)
//    );

//    // 生成时钟信号
//    integer file_output;
//    integer count=0;
//    initial begin 
//        file_output = $fopen("result.txt","w");
//    end
            
//    initial begin
//        clk = 0;
//        forever #5 clk = ~clk; // 10ns的时钟周期
//    end
//    initial begin
//        reset = 1;
//        #10 reset = 0;
//    end
//    always @ (posedge clk)
//    begin
//        count = count + 1;

//        $fdisplay(file_output,"pc = %h",pc);
//        $fdisplay(file_output,"instr = %h",instr);
//        $fdisplay(file_output,"regfile0 = %h",regfile0);
//        $fdisplay(file_output,"regfile1 = %h",regfile1);
//        $fdisplay(file_output,"regfile2 = %h",regfile2);
//        $fdisplay(file_output,"regfile3 = %h",regfile3);
//        $fdisplay(file_output,"regfile4 = %h",regfile4);
//        $fdisplay(file_output,"regfile5 = %h",regfile5);
//        $fdisplay(file_output,"regfile6 = %h",regfile6);
//        $fdisplay(file_output,"regfile7 = %h",regfile7);
//        $fdisplay(file_output,"regfile8 = %h",regfile8);
//        $fdisplay(file_output,"regfile9 = %h",regfile9);
//        $fdisplay(file_output,"regfile10 = %h",regfile10);
//        $fdisplay(file_output,"regfile11 = %h",regfile11);
//        $fdisplay(file_output,"regfile12 = %h",regfile12);
//        $fdisplay(file_output,"regfile13 = %h",regfile13);
//        $fdisplay(file_output,"regfile14 = %h",regfile14);
//        $fdisplay(file_output,"regfile15 = %h",regfile15);
//        $fdisplay(file_output,"regfile16 = %h",regfile16);
//        $fdisplay(file_output,"regfile17 = %h",regfile17);
//        $fdisplay(file_output,"regfile18 = %h",regfile18);
//        $fdisplay(file_output,"regfile19 = %h",regfile19);
//        $fdisplay(file_output,"regfile20 = %h",regfile20);
//        $fdisplay(file_output,"regfile21 = %h",regfile21);
//        $fdisplay(file_output,"regfile22 = %h",regfile22);
//        $fdisplay(file_output,"regfile23 = %h",regfile23);
//        $fdisplay(file_output,"regfile24 = %h",regfile24);
//        $fdisplay(file_output,"regfile25 = %h",regfile25);
//        $fdisplay(file_output,"regfile26 = %h",regfile26);
//        $fdisplay(file_output,"regfile27 = %h",regfile27);
//        $fdisplay(file_output,"regfile28 = %h",regfile28);
//        $fdisplay(file_output,"regfile29 = %h",regfile29);
//        $fdisplay(file_output,"regfile30 = %h",regfile30);
//        $fdisplay(file_output,"regfile31 = %h",regfile31);

//    end

//endmodule
