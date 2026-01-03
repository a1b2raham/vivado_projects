`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 11:14:12
// Design Name: 
// Module Name: mem_bank
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


module mem_bank(
    input clk,
    input rst,
    input [4:0] rs1,
    input [4:0] rs2,
    output [31:0] rd1,
    output [31:0] rd2,
    input we,
    input [4:0] wa,
    input [31:0] wd
    );
    
    reg [31:0] mem[31:0];
    
    assign rd1 = (rs1 == 5'b0)? 32'b0: mem[rs1];
    assign rd2 = (rs2 == 5'b0)? 32'b0: mem[rs2];
    
    
    integer i;
    
    
    always @(posedge clk or posedge rst)
    begin
        if(rst)
            begin
                for(i=0;i<32;i=i+1)
                mem[i] <= 32'b0;  
            end
        else if(we && (wa != 5'b0))
                mem[wa] <= wd;
    end
    
endmodule
