module InstMem(clock, address, inst);

	input clock;
	input [63:0] address;
	
	output reg [63:0] inst;
	
	reg [255:0] Mem [0:255];
	
	always @( posedge clock) begin
		inst <= Mem[address];
	end
endmodule




// B    : 00000000000000000000000000000000/00000000000000000000000000000101
// AND  : 00000000000000000000000000000000/00000000000000000000010001010000
// ADD  : 00000000000000000000000000000000/00000000000000000000010001011000
// ORR  : 00000000000000000000000000000000/00000000000000000000010101010000
// SUB  : 00000000000000000000000000000000/00000000000000000000011001011000
// STUR : 00000000000000000000000000000000/00000000000000000000011111000000
// LDUR : 00000000000000000000000000000000/00000000000000000000011111000010