`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/06 11:18:34
// Design Name: 
// Module Name: exe_logic
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
module exe_logic(
    ope_data_1,ope_data_2,aluop,w_data_logic
    );
    input wire[`reg_data_bus] ope_data_1;
    input wire[`reg_data_bus] ope_data_2;
    input wire[`aluop_bus] aluop;
    output wire[`reg_data_bus] w_data_logic;

    assign w_data_logic = (aluop==`EX_LUI_O)?ope_data_1:(aluop==`EX_AND_O||aluop==`EX_ANDI_O)?ope_data_1&ope_data_2:(aluop==`EX_OR_O||aluop==`EX_ORI_O)?ope_data_1|ope_data_2:(aluop==`EX_XOR_O||aluop==`EX_XORI_O)?ope_data_1^ope_data_2:`zero_32;

endmodule
