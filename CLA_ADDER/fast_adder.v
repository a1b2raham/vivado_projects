`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2025 21:31:10
// Design Name: 
// Module Name: fast_adder
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


module fast_adder(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [6:0] t_out,
    output [6:0] o_out
    );
    
    wire g0,g1,g2,g3,p0,p1,p2,p3;
    wire c1,c2,c3;
    wire [3:0] sum;
    wire cout;
    reg [5:0] bcd_reg,temp;
    
    wire [1:0] tens;
    wire [3:0] ones;
    
    
    assign g0=a[0]&b[0],g1 = a[1]&b[1],g2 = a[2]&b[2],g3 = a[3]&b[3];
    assign p0 = a[0]^b[0], p1 = a[1]^b[1], p2 = a[2]^b[2],p3 = a[3]^b[3];
    
    assign c1 = g0|(cin&p0),
    c2 = g1|(p1&g0)|(p1&p0&cin),
    c3 = g2|(p2&g1)|(p2&p1&g0)|(p2&p1&p0&cin),
    cout = g3|(p3&g2)|(p3&p2&g1)|(p3&p2&p1&g0)|(p3&p2&p1&p0&cin);
    
    assign sum[0] = p0^cin,
    sum[1] = p1^c1,
    sum[2] = p2^c2,
    sum[3] = p3^c3;
    
    // sum to bcd conversion
     
    always @(*)
    begin
    temp <= {cout,sum};
    if(temp<10)
        bcd_reg <= temp;
    else
    begin
    if(temp<20)
    bcd_reg <= temp + 4'b0110;//6
    else if(temp<30)
    bcd_reg <= temp + 4'b1100;//12
    else if(temp==30)
    bcd_reg <= 6'b110000;
    else
    bcd_reg <= 6'b110001;
    end
    end
    assign {tens,ones} = bcd_reg;
    
    segment_7 one(
        .num(ones),
        .segment(o_out)
    );
    
    segment_7 ten(
        .num({2'b0,tens}),
        .segment(t_out)
    );
    
 endmodule
