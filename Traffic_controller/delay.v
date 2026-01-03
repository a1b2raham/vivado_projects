`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.12.2025 17:36:30
// Design Name: 
// Module Name: delay
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


module delay(
    input [2:0] state,
    input clk,
    input rst,
    output reg out
    );
    
    reg [2:0] n;
    
    always @(posedge clk or posedge rst)
    begin
    if(rst)
    begin 
    n<=3'b000;
    out <= 0;
    end
    else
    begin
    if(n < state)
    begin
    n <= n+1;
    out <= 0;
    end
    else
    begin 
    n <= 3'b00;
    out <= 1;
    end
    end
    end
    
endmodule
