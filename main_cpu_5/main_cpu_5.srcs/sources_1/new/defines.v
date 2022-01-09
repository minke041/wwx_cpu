`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/26 15:12:13
// Design Name: 
// Module Name: defines
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


`define rst_enable 1'b1
`define rst_disable 1'b0
`define fetch_enable 1'b1
`define fetch_disable 1'b0
`define inst_addr 31:0
`define inst_bus 31:0
`define zero_32 32'b0
`define one_32 32'b11111111111111111111111111111111
`define reg_data_bus 31:0
`define reg_addr_bus 4:0
`define r_enable 1'b1
`define r_disable 1'b0
`define w_enable 1'b1
`define w_disable 1'b0
`define zero_5 5'b0
`define inform_width 55:0
`define aluop_bus 7:0
`define alusel_bus 3:0
`define it_is 1'b1 
`define it_is_not 1'b0


`define special_op_1 6'b000000
`define special_op_2 6'b011100


/*
`define class_no 2'b00
`define class_r 2'b01 
`define class_i 2'b10 
`define class_j 2'b11
*/
//---alusel_nop---//
`define alusel_nop 4'b0000 
`define EXE_NOP_O 8'b0

//---alusel_logic---//
`define alusel_logic 4'b0001

`define EX_AND 6'b100100
`define EX_OR 6'b100101
`define EX_XOR 6'b100110
`define EX_NOR 6'b100111

`define EX_ANDI 6'b001100
`define EX_XORI 6'b001110
`define EX_LUI 6'b001111
`define EX_ORI 6'b001101

`define EX_AND_O 8'b01100100
`define EX_OR_O 8'b01100101
`define EX_XOR_O 8'b01100110
`define EX_NOR_O 8'b01100111

`define EX_ANDI_O 8'b10001100
`define EX_XORI_O 8'b10001110
`define EX_LUI_O 8'b10001111
`define EX_ORI_O 8'b10001101

//---alusel_shift---//
`define alusel_shift 4'b0010 

`define EX_SLL 6'b000000
`define EX_SRL 6'b000010
`define EX_SRA 6'b000011
`define EX_SLLV 6'b000100 
`define EX_SRLV 6'b000110
`define EX_SRAV 6'b000111

`define EX_SLL_O 8'b01000000
`define EX_SRL_O 8'b01000010
`define EX_SRA_O 8'b01000011
`define EX_SLLV_O 8'b01000100 
`define EX_SRLV_O 8'b01000110
`define EX_SRAV_O 8'b01000111

//---alusel_move---//
`define alusel_move 4'b0011 

`define EX_MOVN_O 8'b01001011 
`define EX_MOVZ_O 8'b01100001
`define EX_MFHI_O 8'b01010000 
`define EX_MFLO_O 8'b01010010 
`define EX_MTHI_O 8'b01010001 
`define EX_MTLO_O 8'b01010011 


//---alusel_arthmetic---//
`define alusel_arthmetic 4'b0100


//---
