`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/01 19:50:23
// Design Name: 
// Module Name: P_Q
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


module P_Q(
    a,b,P,Q
    );
    input wire[3:0] a;
    input wire[3:0] b;
    output wire[3:0] P;
    output wire[3:0] Q;

    assign P[3:0]=a[3:0]^b[3:0];
    assign Q[3:0]=a[3:0]&b[3:0]; 
endmodule
