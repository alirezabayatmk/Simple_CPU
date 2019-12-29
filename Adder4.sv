module Adder4(PCout, i, AddOut);

	input [63:0] PCout;
	input i;
	
	output reg [63:0] AddOut;

	always @(*) begin
		i <= 4;
		AddOut <= PCout + i;
	end
endmodule