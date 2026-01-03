`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 16:02:39
// Design Name: 
// Module Name: alu
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


module alu(
    input [3:0] alu_control,
    input [31:0] rs1,
    input [31:0] rs2,
    
    output reg [31:0] ans
    );
    
    always @(*)
    begin
        case(alu_control)
            2: ans = rs1 +rs2;
            4: ans = rs1 - rs2;
            1: ans = rs1 | rs2;
            3: ans = rs1 << rs2;
            5: ans = rs1 >> rs2;
            7: ans = rs1 ^ rs2;
            0: ans = rs1 & rs2;
            default: ans = 32'b0;
        endcase
    end
endmodule
