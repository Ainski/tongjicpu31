module mux2(
    input [31:0] NPC,r,dmemdata,
    input [1:0] M2,
    output [31:0] rdd
);
assign rdd = (M2 == 2'b00)? r : 
    (M2 == 2'b01)? dmemdata : 
    (M2 == 2'b10)? NPC : 
    32'h0;
endmodule