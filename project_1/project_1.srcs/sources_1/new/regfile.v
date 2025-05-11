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

    integer i;  // 声明循环变量

    always @(negedge RF_CLK) begin
        if (RF_RST) begin
            for (i = 0; i < 32; i=i+1) begin
                regfile[i] <= 32'h0;  // 复位所有寄存器
            end
        end else if (RF_W && mux3out != 6'b0) begin  // 避免写入零寄存器
            regfile[mux3out] <= rdd;
        end 
    end
    
    // 输出逻辑保持不变
    assign rt = regfile[rtc];
    assign rd = regfile[rsc];
    assign rs = regfile[mux3out];

endmodule