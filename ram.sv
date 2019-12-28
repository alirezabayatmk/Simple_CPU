`default_nettype none
`timescale 1ns/10ps

`include "clk.sv"
`include "pc.sv"

module ram (parameter address=64, data=64, size=256) (
	input wire clk, 
	input wire [address-1:0] i_addr,
	input wire i_write,
	input wire [data-1:0] i_data,
	output reg [size-1:0] o_data
	);


	reg [size-1:0] memory_array [0:size-1];
	
	clock clock1(clk);
	reg pc1(clk, write, clear, i, pc);

	always@(posedge clk)
	begin 
		if(i_write) begin
			memoory_array[i_addr] <= i_data;
		end
	assign o_data = memory_array[i_addr];
	end
endmodule