module npcmaker(
    input [31:0] imdt,
    input [31:0] npc,
    input Btype,
    input Ze,
    output [31:0] npc_out
);

wires [31:0] npc_out_wire;

assign npc_out_wire = imdt + npc;

assign npc_out =(Ze&Btype)? npc_out_wire : npc;
endmodule
