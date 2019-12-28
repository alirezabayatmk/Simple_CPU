`default_nettype none
`timescale 1ns/10ps

module clock(CLK);

	parameter delay = 50;
	

	output reg CLK;

	always 
	begin
		CLK=0;
		#delay;
		CLK=1;
		#delay;

	end
		
endmodule




// module clock;
// 	reg clk;
// initial begin
//  clk=0;
//  $dumpfile("clock.vcd");
// always #10 clk=~clk;
// endmodule