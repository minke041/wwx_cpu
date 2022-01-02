`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/01 19:53:36
// Design Name: 
// Module Name: get_pre
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


module get_pre(
    P,Q,pre_0,pre0_3,pre_4
    );
    input wire[3:0] P;
    input wire[3:0] Q;
    input wire pre_0;
    output wire[3:0] pre0_3;
    output wire pre_4;

    assign pre0_3[0] = pre_0;
    assign pre0_3[1] = Q[0]|(pre_0&P[0]);
    assign pre0_3[2] = Q[1]|(P[1]&Q[0])|(pre_0&P[0]&P[1]);
    assign pre0_3[3] = Q[2]|(P[2]&Q[1])|(P[2]&P[1]&Q[0])|(pre_0&P[0]&P[1]&P[2]);
    assign pre_4 = Q[3]|(P[3]&Q[2])|(P[3]&P[2]&Q[1])|(P[3]&P[2]&P[1]&Q[0])|(P[3]&P[2]&P[1]&P[0]&pre_0);
endmodule
