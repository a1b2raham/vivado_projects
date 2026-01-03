`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2026 23:15:02
// Design Name: 
// Module Name: instruction_mem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module instruction_mem(
    input clk,
    input rst,
    input [5:0] read_add,
    output reg [31:0] instruct
    );
    integer k;
    
    reg [31:0] I_mem [63:0];
    always @(posedge clk or posedge rst)
    begin
    if(rst)
        begin
            for(k=0;k<64;k=k+1)begin
            I_mem[k] <= 32'b00;
            end
        end
    else
        instruct <= I_mem[read_add];
    end
    
    
endmodule
