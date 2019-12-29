module Control(
	input [6:0] Opcode, 
	output reg RegWrite, ALUSrc, MemtoReg, MemRead, MemWrite, Branch, 
	output reg [1:0 ALUOp])

	
	always @(*) begin
		case(Opcode)
			51: begin //R-format
				ALUSrc 		<= 0;
				MemtoReg	<= 0;
				RegWrite	<= 1;
				MemRead		<= 0;
				MemWrite	<= 0;
				Branch		<= 0;
				ALUOp		<= 2'b10;;
			end
			3: begin //ld
				ALUSrc 		<= 1;
				MemtoReg	<= 1;
				RegWrite	<= 1;
				MemRead		<= 1;
				MemWrite	<= 0;
				Branch		<= 0;
				ALUOp		<= 2'b00;;
			end
			35: begin //sd
				ALUSrc 		<= 1;
				MemtoReg	<= 0;
				RegWrite	<= 0;
				MemRead		<= 0;
				MemWrite	<= 1;
				Branch		<= 0;
				ALUOp		<= 2'b00;
			end
			99: begin //beq
				ALUSrc 		<= 0;
				MemtoReg	<= 0;
				RegWrite	<= 0;
				MemRead		<= 0;
				MemWrite	<= 0;
				Branch		<= 1;
				ALUOp		<= 2'b01;
			end
		endcase
	end
endmodule