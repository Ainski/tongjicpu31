module mux1 (
    input wire [31:0] jextend,
    input wire [31:0] mux5,
    input wire M1,
    output [31:0] mux1out
);
assign mux1out = (M1)? mux5 : jextend;
endmodule