module regfile(
    input RF_CLK,
    input RF_RST,
    input RF_W,
    input [31:0] rdd,
    input [5:0] mux3out,
    input [5:0]rsc,
    input [5:0]rtc,
    output [31:0] rt,
    output [31:0] rd,
    output [31:0] rs
);

    reg [31:0] regfile [0:31];

    always @(posedge RF_CLK) begin
        if (RF_RST) begin
            for (int i = 0; i < 32; i++) begin
                regfile[i] <= 0;
            end
        end else if (RF_W) begin
            regfile[mux3out] <= rdd;
        end 
    end
    assign rt = regfile[rtc];
    assign rd = regfile[rsc];
    assign rs = regfile[mux3out];

endmodule