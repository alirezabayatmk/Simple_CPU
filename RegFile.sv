module RegFile(clock, RegWrite, ReadReg1, ReadReg2, WriteReg, WriteData, ReadData1, ReadData2);

	input clock;
	input RegWrite;
	
	input [4:0] ReadReg1, ReadReg2, WriteReg; //19-15 * 24-20 * 11-7
	input [63:0] WriteData;
		
	output [63:0] ReadData1, ReadData2;
	
	reg [31:0] reg_mem [0:1023];

	assign ReadData1 = reg_mem[ReadReg1];
	assign ReadData2 = reg_mem[ReadReg2];
	
	always @(posedge clock) begin
		if (RegWrite == 1)
			reg_mem[WriteReg] <= WriteData;
	end	
endmodule

// ReadReg1 = instruction[19:15]
// ReadReg2 = instruction[24:20]
// WriteReg = instruction[11:7]