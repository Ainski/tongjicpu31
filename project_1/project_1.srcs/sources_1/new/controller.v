`timescale 1ns / 1ps
module controller(
    input [5:0] op,
    input [5:0] func,
    output [1:0]M1,
    output [1:0]M2,
    output [1:0]M3,
    output [1:0]M4,
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
    parameter add = 100000;
    parameter addu = 100001;
    parameter sub = 100010;
    parameter subu = 100011;
    parameter and_op = 100100;
    parameter or_op = 100101;
    parameter xor_op = 100110;
    parameter nor_op = 100111;
    parameter slt = 101010;
    parameter sltu = 101011;
    parameter sll = 000000;
    parameter srl = 000010;
    parameter sra = 000011;
    parameter sllv = 000100;
    parameter srlv = 000110;
    parameter srav = 000111;
    parameter jr = 001000;

    parameter addi=001000;
    parameter addiu=001001;
    parameter andi=001100;
    parameter ori=001101;
    parameter xori=001110;
    parameter lw=100011;
    parameter sw=101011;
    parameter beq=000100;
    parameter bne=000101;
    parameter slti=001010;
    parameter sltiu=001011;
    parameter lui=001111;
    parameter j=000010;
    parameter jal=000011;

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
    parameter add_aluc=0010;
    parameter addu_aluc=0000;
    parameter sub_aluc=0011;
    parameter subu_aluc=0001;
    parameter and_aluc=0100;
    parameter or_aluc=0101;
    parameter xor_aluc=0110;
    parameter nor_aluc=0111;
    parameter slt_aluc=1011;
    parameter sltu_aluc=1010;
    parameter sll_aluc=1110;
    parameter srl_aluc=1101;
    parameter sra_aluc=1100;
    parameter lui_aluc=1000;

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
    assign RF_W=(jrT|lwT|swT|beqT|bneT|jT|jalT)?0:1;
    assign su=(addiT|andiT|oriT|xoriT|lwT|swT|beqT|bneT|sltiT)?1:0;
    assign M2=(lwT)?2'b01:(jalT)?2'b10:2'b00;
    assign M4=(sllT|srlT|sraT)?2'b01:(addi|addiu|andi|ori|xori|lw|sw|beq|bne|slti|sltiu|lui)?2'b10:2'b00;
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
    (sllT)?sll_aluc:
    (srlT)?srl_aluc:
    (sraT)?sra_aluc:
    (luiT)?lui_aluc:0;
    assign M5=(sllT|srlT|sraT|addiT|addiuT|andiT|oriT|xoriT)?2'b11:(luiT)?2'b10:2'b00;
    assign M6=(beqT)?1:0;
    assign M3=(lwT|swT|sltiT|sltiuT|luiT)?2'b10:(jalT)?2'b01:2'b00;
endmodule 