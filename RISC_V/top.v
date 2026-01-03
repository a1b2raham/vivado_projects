`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 11:47:52
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input rst
    );
    wire [5:0] pc_in,pc_out;
    wire [31:0] instruct,rs1,interim,ans,rs2;
    wire [3:0] alu_control;
    wire reg_write;
    
    pc first(clk,rst,pc_in,pc_out);
    pc_adder second(pc_out,pc_in);
    instruction_mem u_imem(clk,rst,pc_out,instruct);
    control fourth(instruct[5:0],instruct[18:16],instruct[30],alu_control,reg_write);
    mem_bank u_regs(clk, rst,instruct[10:6],instruct[23:19],rs1,interim,reg_write,instruct[15:11],ans);
    mul sixth(instruct[30:19],interim,rs2,instruct[5]);
    alu seventh(alu_control,rs1,rs2,ans);
    /*
    in my design [5:0] is opcode,[10:6] is rs1,[15:11] is rd, 
    [18:16] is func3,bit 30 is func7,[23:19] is rs2 and [30:19] is immediate data

    */
endmodule
