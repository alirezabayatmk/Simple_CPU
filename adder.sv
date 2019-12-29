module Adder(PCout, ShiftOut, AddOut);

	input [63:0] PCout;
	input [63:0] ShiftOut;
	
	output reg [63:0] AddOut;

	always @(*) begin
		AddOut <= PCout + ShiftOut;
	end
endmodule