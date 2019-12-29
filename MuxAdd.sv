module MuxAdd (PCout, AddOut, Add4Out, AndOut, PCin);

	input [31:0] PCout, AddOut, Add4Out;
	input AndOut;	
	
	output reg [31:0] PCin;
	
	initial begin
		PCin <= 0;
	end
	
	always @(*) begin
		case (AndOut)
			0: PCin <= Add4Out;
			1: PCin <= AddOut;
		endcase
	end
endmodule