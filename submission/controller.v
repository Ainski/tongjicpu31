`timescale 1ns / 1ps
module controller(
    input [5:0] op,
    input [5:0] func,
    output [1:0]M1,
    output [1:0]M2,
    output [1:0]M3,
    output M4,
    output [1:0]M5,
    output M6,
    output IM_R,
    output RF_W,
    output su,
    output [3:0]aluc,
    output CS,
    output DM_W,
    output DM_R,
    output Btype
);
    parameter add = 6'b100000;
    parameter addu = 6'b100001;
    parameter sub = 6'b100010;
    parameter subu = 6'b100011;
    parameter and_op =6'b100100;
    parameter or_op =6'b100101;
    parameter xor_op = 6'b100110;
    parameter nor_op = 6'b100111;
    parameter slt = 6'b101010;
    parameter sltu = 6'b101011;
    parameter sll = 6'b000000;
    parameter srl = 6'b000010;
    parameter sra = 6'b000011;
    parameter sllv = 6'b000100;
    parameter srlv = 6'b000110;
    parameter srav = 6'b000111;
    parameter jr = 6'b001000;

    parameter addi=6'b001000;
    parameter addiu=6'b001001;
    parameter andi=6'b001100;
    parameter ori=6'b001101;
    parameter xori=6'b001110;
    parameter lw=6'b100011;
    parameter sw=6'b101011;
    parameter beq=6'b000100;
    parameter bne=6'b000101;
    parameter slti=6'b001010;
    parameter sltiu=6'b001011;
    parameter lui=6'b001111;
    parameter j=6'b000010;
    parameter jal=6'b000011;

// add	0010
// addu	0000
// sub	0011
// subu	0001
// and	0100
// or	0101
// xor	0110
// nor	0111
// slt	1011
// sltu	1010
// sll	1110
// srl	1101
// sra	1100
// lui	1000
    parameter add_aluc=4'b0010;
    parameter addu_aluc=4'b0000;
    parameter sub_aluc=4'b0011;
    parameter subu_aluc=4'b0001;
    parameter and_aluc=4'b0100;
    parameter or_aluc=4'b0101;
    parameter xor_aluc=4'b0110;
    parameter nor_aluc=4'b0111;
    parameter slt_aluc=4'b1011;
    parameter sltu_aluc=4'b1010;
    parameter sll_aluc=4'b1110;
    parameter srl_aluc=4'b1101;
    parameter sra_aluc=4'b1100;
    parameter lui_aluc=4'b1000;

    wire addT,  adduT,  subT,  subuT,  andT,  orT,  xorT,
        norT,  sltT,  sltuT,   sllT,   srlT,  sraT, sllvT,
        srlvT, sravT,  jrT,   addiT, addiuT, andiT,  oriT,
        xoriT, lwT,    swT,   beqT,  bneT,  sltiT,  sltiuT, 
        luiT,jT,jalT;
    assign addT = (op==0) & (func==add);
    assign adduT = (op==0) & (func==addu);
    assign subT = (op==0) & (func==sub);
    assign subuT = (op==0) & (func==subu);
    assign andT = (op==0) & (func==and_op);
    assign orT = (op==0) & (func==or_op);
    assign xorT = (op==0) & (func==xor_op);
    assign norT = (op==0) & (func==nor_op);
    assign sltT = (op==0) & (func==slt);
    assign sltuT = (op==0) & (func==sltu);
    assign sllT = (op==0) & (func==sll);
    assign srlT = (op==0) & (func==srl);
    assign sraT = (op==0) & (func==sra);
    assign sllvT = (op==0) & (func==sllv);
    assign srlvT = (op==0) & (func==srlv);
    assign sravT = (op==0) & (func==srav);
    assign jrT = (op==0) & (func==jr);

    assign addiT=(op==addi);
    assign addiuT=(op==addiu);
    assign andiT=(op==andi);
    assign oriT=(op==ori);
    assign xoriT=(op==xori);
    assign lwT=(op==lw);
    assign swT=(op==sw);
    assign beqT=(op==beq);
    assign bneT=(op==bne);
    assign sltiT=(op==slti);
    assign sltiuT=(op==sltiu);
    assign luiT=(op==lui);
    assign jT=(op==j);
    assign jalT=(op==jal);

    assign M1=(jrT)?2'b10:(jT||jalT)?2'b01:2'b00;
    assign IM_R=1;
    assign RF_W=(jrT|swT|beqT|bneT|jT)?0:1;
    assign su=(addiT|addiuT|lwT|swT|beqT|bneT|sltiT)?1:0;
    assign M2=(lwT)?2'b01:(jalT)?2'b10:2'b00;
    assign M4=(addiT|addiuT|andiT|oriT|xoriT|lwT|swT|sltiT|sltiuT|luiT)?1:0;
    assign CS=(lwT|swT)?1:0;
    assign DM_W=(swT)?1:0;
    assign DM_R=(lwT)?1:0;
    assign Btype=(beqT|bneT)?1:0;
    assign aluc=
    (addT|addiT)?add_aluc:
    (adduT|addiuT)?addu_aluc:
    (subT|subuT|bneT|beqT)?sub_aluc:
    (andT|andiT)?and_aluc:
    (orT|oriT)?or_aluc:
    (xorT|xoriT)?xor_aluc:
    (norT)?nor_aluc:
    (sltT|sltiT)?slt_aluc:
    (sltuT|sltiuT)?sltu_aluc:
    (sllT|sllvT)?sll_aluc:
    (srlT|srlvT)?srl_aluc:
    (sraT|sravT)?sra_aluc:
    (luiT)?lui_aluc:0;
    assign M5=(sllT|srlT|sraT)?2'b01:(luiT)?2'b10:2'b00;
    assign M6=(beqT)?1:0;
    assign M3=(lwT|swT|sltiT|sltiuT|luiT|addiT|addiuT|andiT|oriT|xoriT)?2'b10:(jalT)?2'b01:2'b00;
endmodule 