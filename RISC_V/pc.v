`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2026 22:34:16
// Design Name: 
// Module Name: pc
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


module pc(
    input clk,
    input rst,
    input [5:0] pc_in,
    output reg [5:0] pc_out
    );
    
    always @(posedge clk or posedge rst)
    begin
        if(rst)
        pc_out <= 6'b00;
        else
        pc_out <= pc_in;
    end
endmodule
