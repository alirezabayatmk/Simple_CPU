module And(Branch, Zero, AndOut);
	input Branch;
	input Zero;
	output reg AndOut;
	
	always @(*) begin
		AndOut <= Branch && Zero;
	end
endmodule