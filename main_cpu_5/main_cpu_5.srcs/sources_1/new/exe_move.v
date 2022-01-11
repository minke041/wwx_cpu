`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/10 16:42:07
// Design Name: 
// Module Name: exe_move
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
module exe_move(
    ope_data_1,
    ope_data_2,
    aluop,
    w_data_move,
    hi_r_data,
    lo_r_data,
    hilo_inform_move
    );
    input wire[`reg_data_bus] ope_data_1;
    input wire[`reg_data_bus] ope_data_2;
    input wire[`aluop_bus] aluop;
    input wire[`reg_data_bus] hi_r_data;
    input wire[`reg_data_bus] lo_r_data;
   
    output wire[`reg_data_bus] w_data_move;
    output wire[`hilo_inform_width] hilo_inform_move;

    wire hilo_w_en_move = (aluop==`EX_MTHI_O||aluop==`EX_MTLO_O)?`w_enable:`w_disable;
    wire[`reg_data_bus] hi_w_data_move = (aluop==`EX_MTHI_O)?ope_data_1:`zero_32;
    wire[`reg_data_bus] lo_w_data_move = (aluop==`EX_MTLO_O)?ope_data_1:`zero_32;

    assign w_data_move = (aluop==`EX_MOVN_O)?((ope_data_2==`zero_32)?`zero_32:ope_data_1):
                         (aluop==`EX_MOVZ_O)?((ope_data_2==`zero_32)?ope_data_1:`zero_32):
                         (aluop==`EX_MFHI_O)?hi_r_data:
                         (aluop==`EX_MFLO_O)?lo_r_data:
                         `zero_32;

    assign hilo_inform_move[`hilo_inform_width] = {hilo_w_en_move,hi_w_data_move[`reg_data_bus],lo_w_data_move[`reg_data_bus]};

    
    
endmodule
