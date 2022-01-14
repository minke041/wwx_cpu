`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/01 19:46:47
// Design Name: 
// Module Name: pre_adder_4
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


module pre_adder_4(
    a,
    b,
    pre_0,
    pre_4,
    sum
    );
    input wire[3:0] a;
    input wire[3:0] b;
    input wire pre_0;
    output wire pre_4;
    output wire[3:0] sum;

    wire[3:0] P;
    wire[3:0] Q;
    wire[3:0] pre0_3;

    P_Q P_Q0(.a(a),.b(b),.P(P),.Q(Q));
    get_pre get_pre0(.P(P),.Q(Q),.pre_0(pre_0),.pre0_3(pre0_3),.pre_4(pre_4));
    get_sum get_sum0(.P(P),.sum(sum),.pre0_3(pre0_3));

endmodule
