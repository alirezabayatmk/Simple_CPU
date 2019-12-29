module SignExtend (inst32_0, Extend64);

	input [31:0] inst32_0;
	output reg [63:0] Extend64;

	always @(posedge clock) begin
		Extend64[63:0] <= inst32_0[31:0];
	end
endmodule