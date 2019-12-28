`default_nettype none
`timescale 1ns/10ps

`include "clk.sv"

module pc(input clk, input write, input clear, input [63:0] i, output [63:0] pc);

reg [63:0] pc;
clock clock1(clk);

always@(posedge clk)
    begin
        if(write)
            begin
                pc <= 64'd0;
            end
        else
            begin
                pc <= i;
            end             
    end
endmodule
