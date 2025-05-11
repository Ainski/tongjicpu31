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
    output [31:0] rs
);

    reg [31:0] regfile [0:31];

    integer i;  // ����ѭ������

    always @(negedge RF_CLK) begin
        if (RF_RST) begin
            for (i = 0; i < 32; i=i+1) begin
                regfile[i] <= 32'h0;  // ��λ���мĴ���
            end
        end else if (RF_W && mux3out != 6'b0) begin  // ����д����Ĵ���
            regfile[mux3out] <= rdd;
        end 
    end
    
    // ����߼����ֲ���
    assign rt = regfile[rtc];
    assign rd = regfile[rsc];
    assign rs = regfile[mux3out];

endmodule