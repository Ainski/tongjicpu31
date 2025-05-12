`timescale 1ns / 1ps
module DMEM(
    input clk, //�첽�ź�
    input [31:0] rt,
    input [31:0] DMEMaddr, //r,F
    input CS,
    input DM_W,
    input DM_R,
    output [31:0] DMEMdata
);

reg [31:0] DMEM [0:2047];
//initial begin
//    $readmemb("DMEM.txt", DMEM);
//end
always @(posedge clk) begin
    if(CS) begin
        if(DM_W) begin
            DMEM[DMEMaddr] <= rt;
        end
    end
end
assign DMEMdata = DMEM[DMEMaddr]&CS&DM_R;


endmodule