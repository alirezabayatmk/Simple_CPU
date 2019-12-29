module InstMem(clock, address, inst);

	input clock;
	input [63:0] address;
	
	output reg [63:0] inst;
	
	reg [255:0] Mem [0:255];
	
	initial begin
		$readmemb("instruction.txt", Mem, 0, 5);
	end
	
	always @( posedge clock) begin
		inst <= Mem[address[63:0]];
	end
endmodule




// B    : 0000000000000000000000000000000000000000000000000000000000000101
// AND  : 0000000000000000000000000000000000000000000000000000010001010000
// ADD  : 0000000000000000000000000000000000000000000000000000010001011000
// ORR  : 0000000000000000000000000000000000000000000000000000010101010000
// SUB  : 0000000000000000000000000000000000000000000000000000011001011000
// STUR : 0000000000000000000000000000000000000000000000000000011111000000
// LDUR : 0000000000000000000000000000000000000000000000000000011111000010