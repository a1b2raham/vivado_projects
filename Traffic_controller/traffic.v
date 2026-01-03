`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.12.2025 17:50:47
// Design Name: 
// Module Name: traffic
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


module traffic(
    input ped, 
    input clk,
    input rst,
    output reg r,
    output reg g,
    output reg y,
    output reg [2:0] current_state
    );
    
    reg [2:0] nxt_state;
    localparam RED = 3'b011;
    localparam GREEN = 3'b100;
    localparam YELLOW = 3'b001;
    
    wire done;
    delay first(current_state,clk,rst,done);
    
    always @(posedge clk or posedge rst)
    begin
    if(rst) current_state <= RED;
    else if(ped) current_state <= RED;
    else current_state <= nxt_state;
    end
        
    always@(*)
    begin
    nxt_state = current_state; 
    case(current_state)
    RED:if(done) nxt_state = YELLOW;
    YELLOW:if(done) nxt_state = GREEN;
    GREEN:if(done) nxt_state = RED;
    default: nxt_state = RED;
    endcase
    end
    
    always @(*)
    begin
    r=0;y=0;g=0;
    case(current_state)
    RED:r=1;
    GREEN:g=1;
    YELLOW:y=1;
    endcase
    
    end

endmodule
