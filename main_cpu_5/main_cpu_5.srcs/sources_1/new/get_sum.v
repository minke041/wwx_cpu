`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/01 20:12:31
// Design Name: 
// Module Name: get_sum
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


module get_sum(
    P,pre0_3,sum
    );
    input wire[3:0] P;
    input wire[3:0] pre0_3;
    output wire[3:0] sum;

    assign sum[3:0]=P[3:0]^pre0_3[3:0];
endmodule
