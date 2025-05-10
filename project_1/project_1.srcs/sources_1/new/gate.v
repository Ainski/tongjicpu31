module gate(input a,input ctrl);
    assign a = ctrl? 1'b1 : 1'b0;
endmodule