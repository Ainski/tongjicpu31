`timescale 1ns / 1ps
module regfile(
    input RF_CLK,
    input RF_RST,
    input RF_W,
    input [31:0] rdd,
    input [4:0] mux3out,
    input [4:0]rsc,
    input [4:0]rtc,
    output [31:0] rt,
    output [31:0] rd,
    output [31:0] rs,
    output [31:0] regfile0,
    output [31:0] regfile1,
    output [31:0] regfile2,
    output [31:0] regfile3,
    output [31:0] regfile4,
    output [31:0] regfile5,
    output [31:0] regfile6,
    output [31:0] regfile7,
    output [31:0] regfile8,
    output [31:0] regfile9,
    output [31:0] regfile10,
    output [31:0] regfile11,
    output [31:0] regfile12,
    output [31:0] regfile13,
    output [31:0] regfile14,
    output [31:0] regfile15,
    output [31:0] regfile16,
    output [31:0] regfile17,
    output [31:0] regfile18,
    output [31:0] regfile19,
    output [31:0] regfile20,
    output [31:0] regfile21,
    output [31:0] regfile22,
    output [31:0] regfile23,
    output [31:0] regfile24,
    output [31:0] regfile25,
    output [31:0] regfile26,
    output [31:0] regfile27,
    output [31:0] regfile28,
    output [31:0] regfile29,
    output [31:0] regfile30,
    output [31:0] regfile31
);

    reg [31:0] array_reg[0:31];
    assign regfile0 = array_reg[0];
    assign regfile1 = array_reg[1];
    assign regfile2 = array_reg[2];
    assign regfile3 = array_reg[3];
    assign regfile4 = array_reg[4];
    assign regfile5 = array_reg[5];
    assign regfile6 = array_reg[6];
    assign regfile7 = array_reg[7];
    assign regfile8 = array_reg[8];
    assign regfile9 = array_reg[9];
    assign regfile10 = array_reg[10];
    assign regfile11 = array_reg[11];
    assign regfile12 = array_reg[12];
    assign regfile13 = array_reg[13];
    assign regfile14 = array_reg[14];
    assign regfile15 = array_reg[15];
    assign regfile16 = array_reg[16];
    assign regfile17 = array_reg[17];
    assign regfile18 = array_reg[18];
    assign regfile19 = array_reg[19];
    assign regfile20 = array_reg[20];
    assign regfile21 = array_reg[21];
    assign regfile22 = array_reg[22];
    assign regfile23 = array_reg[23];
    assign regfile24 = array_reg[24];
    assign regfile25 = array_reg[25];
    assign regfile26 = array_reg[26];
    assign regfile27 = array_reg[27];
    assign regfile28 = array_reg[28];
    assign regfile29 = array_reg[29];
    assign regfile30 = array_reg[30];
    assign regfile31 = array_reg[31];

    integer i;  // 声明循环变量
    always @(posedge RF_RST) begin
        if (RF_RST) begin
            for (i = 0; i < 32; i=i+1) begin
                array_reg[i] <= 32'h0;  // 复位所有寄存器
            end
        end
    end
        
    always @(posedge RF_CLK) begin
        if (!RF_RST && RF_W && mux3out != 6'b0) begin  // 避免写入零寄存器
            array_reg[mux3out] <= rdd;
        end 
    end
    
    // 输出逻辑保持不变
    assign rt = array_reg[rtc];
    assign rd = array_reg[mux3out];
    assign rs = array_reg[rsc];

endmodule