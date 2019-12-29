`default_nettype none
`timescale 1ns/10ps

module PC(clock, reset, PCin, PCout);

    input clock, reset;
    input [31:0] PCin;
    
    output reg [31:0] PCout;
    
    always @(posedge clock) begin
        if (reset == 1) 
            PCout <= 0;
        else 
            PCout <= PCin + 4; 
    end
endmodule

// module pc(input clk, input write, input clear, input [63:0] i, output [63:0] pc);

// reg [63:0] pc;
// clock clock1(clk);

// always@(posedge clk)
//     begin
//         if(write)
//             begin
//                 pc <= 64'd0;
//             end
//         else
//             begin
//                 pc <= i;
//             end             
//     end
// endmodule
