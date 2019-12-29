module MuxReg (ALUSrc, ReadData2, Extend64, ALU_B);

	input ALUSrc;
	input [63:0] ReadData2,Extend64;	
	
	output reg [63:0] ALU_B;
	
	always @(ALUSrc, ReadData2, Extend64) begin
		case (ALUSrc)
			0: ALU_B <= ReadData2 ;
			1: ALU_B <= Extend64;
		endcase
	end
endmodule