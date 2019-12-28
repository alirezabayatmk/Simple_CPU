`default_nettype none
`timescale 1ns/10ps

`include "clk.sv"
`include "pc.sv"
`include "ram.sv"

module cpu;
	
	wire clk;
	clock clock1(clk);
  reg pc1(clk, write, clear, i, pc);
  mem ram(address=64, data=64, size=256);
	parameter delay = 50;

	initial 
  	begin
      		$dumpfile("cpu.vcd");
      		$dumpvars(0, cpu);
      		#200;
      		$finish;
  	end 
 endmodule