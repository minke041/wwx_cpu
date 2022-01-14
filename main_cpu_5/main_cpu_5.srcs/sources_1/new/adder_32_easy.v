`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/12 15:44:41
// Design Name: 
// Module Name: adder_32_easy
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

`include "defines.v"
module adder_32_easy(
    ope_data_1_add,
    ope_data_2_add,
    sum,
    carry_out
    );
    input wire[`reg_data_bus] ope_data_1_add;
    input wire[`reg_data_bus] ope_data_2_add;
    output wire[`reg_data_bus] sum;
    output wire carry_out;

    wire[8:0] carry;
    assign carry[0] = 0;
    assign carry_out = carry[8];

    genvar i;
    generate 
        for (i=0; i<=7; i=i+1) begin
            pre_adder_4 pre_adder_4(
                        .a(ope_data_1_add[4*i+3:4*i]),
                        .b(ope_data_2_add[4*i+3:4*i]),
                        .pre_0(carry[i]),
                        .pre_4(carry[i+1]),
                        .sum(sum[4*i+3:4*i])
                        ); 
        end
    endgenerate


endmodule
