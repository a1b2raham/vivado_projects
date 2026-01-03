`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 14:00:01
// Design Name: 
// Module Name: control
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


module control(
    input [5:0] op,
    input [2:0] func3,
    input func7,
    output reg [3:0] alu_cont,
    output reg reg_write
    );
    
    always @(op or func3 or func7)
    begin
        if(op == 6'b110011)//r type
        begin
            reg_write = 1'b1;
            
            case(func3)
            0:begin
                if(func7)
                alu_cont = 4'b0010;//add
                else
                alu_cont = 4'b0100;//sub
                end
             6: alu_cont = 4'b0001; // or
             7: alu_cont = 4'b0000; // and
             1: alu_cont = 4'b0011; // sll
             5: alu_cont = 4'b0101; // srl
		     
			 4: alu_cont = 4'b0111; // xor
			 default: alu_cont = 4'b1000;
            endcase   
        end 
        else if (op == 6'b010011)// i type
        begin
        reg_write = 1'b1;  
        case(func3)
             0: alu_cont = 4'b0010;//addi
             6: alu_cont = 4'b0001; // ori
             7: alu_cont = 4'b0000; // andi
             1: alu_cont = 4'b0011; // slli
             5: alu_cont = 4'b0101; // srli
			 4: alu_cont = 4'b0111; // xori
			 default: alu_cont = 4'b1000;
            endcase   
        end 
    end
    
    
endmodule
