`default_nettype none
`timescale 1ns/10ps

module DataMemory (clock, address, MemWrite, MemRead, WriteData, ReadData);

	input clock;
	input [63:0] address;
	input MemWrite, MemRead;
	input [63:0] WriteData; 
	output reg [63:0] ReadData;

	reg [255:0] Mem[0:1023];

	initial begin 
		ReadData <= 0;
		for (i=0;i<256;i=i+1) begin
			Mem[i] <= 0;
		end
	end
	
	always @ (posedge clock) begin
	
		if (MemWrite == 1)
			Mem[address] <= WriteData;
	end
	
	always @(negedge clock) begin
		if (MemRead == 1)
			ReadData <= Mem[address];
	end	
endmodule


// module DataMemory (parameter address=64, data=64, size=256) (
// 	input wire clk, 
// 	input wire [address-1:0] i_addr,
// 	input wire i_write,
// 	input wire [data-1:0] i_data,
// 	output reg [size-1:0] o_data
// 	);


// 	reg [size-1:0] memory_array [0:size-1];
	
// 	clock clock1(clk);
// 	reg pc1(clk, write, clear, i, pc);

// 	always@(posedge clk)
// 	begin 
// 		if(i_write) begin
// 			memoory_array[i_addr] <= i_data;
// 		end
// 	assign o_data = memory_array[i_addr];
// 	end
// endmodule