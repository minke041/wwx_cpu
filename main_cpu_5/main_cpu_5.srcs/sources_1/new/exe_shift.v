`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/08 17:22:48
// Design Name: 
// Module Name: exe_shift
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
module exe_shift(
    ope_data_1,
    ope_data_2,
    aluop,
    w_data_shift
    );
    input wire[`reg_data_bus] ope_data_1;
    input wire[`reg_data_bus] ope_data_2;
    input wire[`aluop_bus] aluop;
    output wire[`reg_data_bus] w_data_shift;

    assign w_data_shift = (aluop==`EX_SLL_O)?ope_data_1<<ope_data_2:
                          (aluop==`EX_SRL_O)?ope_data_1>>ope_data_2:
                          (aluop==`EX_SRA_O)?((ope_data_1[31]==1'b1)?(~(`one_32>>ope_data_2))|ope_data_1:(`one_32>>ope_data_2)&ope_data_1):
                          (aluop==`EX_SLLV_O)?ope_data_2<<ope_data_1[4:0]:
                          (aluop==`EX_SRLV_O)?ope_data_2>>ope_data_1[4:0]:
                          (aluop==`EX_SRA_O)?((ope_data_2[31]==1'b1)?(~(`one_32>>ope_data_1))|ope_data_2:(`one_32>>ope_data_1)&ope_data_2):
                          `zero_32;


endmodule
