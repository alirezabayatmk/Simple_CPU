module Shift (ShiftIn, ShiftOut);

	input [63:0] ShiftIn;
	output reg [63:0] ShiftOut;
	
	always @(ShiftIn) begin
		ShiftOut = ShiftIn << 2;
	end 
	
endmodule