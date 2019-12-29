module Adder4(PCout, i, Add4Out);

	input [63:0] PCout;
	input i;
	
	output reg [63:0] Add4Out;

	always @(*) begin
		i <= 4;
		Add4Out <= PCout + i;
	end
endmodule