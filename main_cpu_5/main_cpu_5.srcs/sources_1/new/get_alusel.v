`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/04 15:37:26
// Design Name: 
// Module Name: get_alusel
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
module get_alusel(
    inst,aluop,alusel 
    );
    input wire[`inst_bus] inst;
    input wire[`aluop_bus] aluop;
    output wire[`alusel_bus] alusel;

    assign alusel = (inst[31:26]==`special_op_2)?`alusel_arthmetic:(aluop==`EX_SLL_O||aluop==`EX_SRL_O||aluop==`EX_SRA_O||aluop==`EX_SLLV_O||aluop==`EX_SRLV_O||aluop==`EX_SRAV_O)?`alusel_shift:(aluop==`EX_MOVN_O||aluop==`EX_MOVZ_O||aluop==`EX_MFHI_O||aluop==`EX_MFLO_O||aluop==`EX_MTHI_O||aluop==`EX_MTLO_O)?`alusel_move:(aluop==`EX_AND_O||aluop==`EX_OR_O||aluop==`EX_XOR_O||aluop==`EX_NOR_O||aluop==`EX_ANDI_O||aluop==`EX_XORI_O||aluop==`EX_LUI_O||aluop==`EX_ORI_O)?`alusel_logic:`alusel_nop;

    
endmodule
