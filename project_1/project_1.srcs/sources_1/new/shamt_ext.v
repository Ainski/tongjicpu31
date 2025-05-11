module shamt_ext(
    input [4:0] shamtT,
    output [31:0] shamt
);
    // 零扩展：将5位shamtT扩展为32位，高27位补零
    assign shamt = {27'b0, shamtT};
endmodule