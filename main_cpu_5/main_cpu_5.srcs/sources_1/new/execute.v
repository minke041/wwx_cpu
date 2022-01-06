`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/06 12:59:15
// Design Name: 
// Module Name: execute
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
module execute(
    rst,ope_data_1_ex,ope_data_2_ex,w_en,w_addr,aluop_ex,alusel_ex,w_data_ex,w_en_ex,w_addr_ex
    );
    input wire rst;
    input wire[`reg_data_bus] ope_data_1_ex;
    input wire[`reg_data_bus] ope_data_2_ex;
    input wire w_en;
    input wire[`reg_addr_bus] w_addr;
    input wire[`aluop_bus] aluop_ex;
    input wire[`alusel_bus] alusel_ex;

    output wire w_en_ex;
    output wire[`reg_addr_bus] w_addr_ex;
    output wire[`reg_data_bus] w_data_ex;

    wire w_en_mid=w_en;
    wire[`reg_addr_bus] w_addr_mid=w_addr;
    wire[`reg_data_bus] w_data_mid;
    
    wire[`reg_data_bus] w_data_logic;
    wire[`reg_data_bus] w_data_shift;

    exe_logic exe_logic0(
    .ope_data_1(ope_data_1_ex),
    .ope_data_2(ope_data_2_ex),
    .aluop(aluop_ex),
    .w_data_logic(w_data_logic)
    );

    exe_choi exe_choi0(
    .alusel(alusel_ex),
    .w_data_logic(w_data_logic),
    .w_data_shift(w_data_shift),
    .w_data(w_data_mid)
    );

    assign w_en_ex = (rst==`rst_enable)?`w_disable:w_en_mid;
    assign w_addr_ex = (rst==`rst_enable)?`zero_5:w_addr_mid;
    assign w_data_ex = (rst==`rst_enable)?`zero_32:w_data_mid;

endmodule
