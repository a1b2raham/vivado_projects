`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.09.2025 14:56:04
// Design Name: 
// Module Name: segment_7
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


module segment_7(
    input [3:0] num,
    output reg [6:0] segment
    );
    
        always @(*) begin
        case (num)
            4'd0:    segment = ~(7'b0111111); 
            4'd1:    segment = ~(7'b0000110);  
            4'd2:    segment = ~(7'b1011011);  
            4'd3:    segment = ~(7'b1001111);  
            4'd4:    segment = ~(7'b1100110);  
            4'd5:    segment = ~(7'b1101101);  
            4'd6:    segment = ~(7'b1111101);  
            4'd7:    segment = ~(7'b0000111);  
            4'd8:    segment = ~(7'b1111111);  
            4'd9:    segment = ~(7'b1101111);  
            default: segment = ~(7'b0000000);  
        endcase
    end
    
endmodule
