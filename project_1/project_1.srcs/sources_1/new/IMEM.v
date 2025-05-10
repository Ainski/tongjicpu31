`timescale 1ns / 1ps
module IMEM(
    input [31:0] address,
    input IM_R,//read a intruction
    output [31:0] instr,
    output [6:0] op,
    output [5:0] rsc,
    output [5:0] rtc,
    output [5:0] rdc,
    output [5:0] shamt,
    output [5:0] func,
    output [16:0] imdtT,//immediate
    output [25:0] indexT

);
    assign op=instr[31:26];
    assign rsc=instr[25:21];
    assign rtc=instr[20:16];
    assign rdc=instr[15:11];
    assign shamt=instr[10:6];
    assign func=instr[5:0];
    assign imdtT=instr[16:0];
    assign indexT=instr[25:0];

    reg [31:0] IMEM [0:2047];
    initial begin
        $readmemb("IMEM.txt", IMEM);
    end
    assign instr=IMEM[address[12:2]] & IM_R;

endmodule