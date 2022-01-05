`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/05 16:43:18
// Design Name: 
// Module Name: de_ex
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
module de_ex(
    clk,rst,ope_data_1_de,ope_data_2_de,w_en_de,w_addr_de,aluop_de,alusel_de,ope_data_1_ex,ope_data_2_ex,w_en_ex,w_addr_ex,aluop_ex,alusel_ex
    );
    input wire clk;
    input wire rst;
    input wire[`reg_data_bus] ope_data_1_de;
    input wire[`reg_data_bus] ope_data_2_de;
    input wire w_en_de;
    input wire[`reg_addr_bus] w_addr_de;
    input wire[`aluop_bus] aluop_de;
    input wire[`alusel_bus] alusel_de;
    output reg[`reg_data_bus] ope_data_1_ex;
    output reg[`reg_data_bus] ope_data_2_ex;
    output reg w_en_ex;
    output reg[`reg_addr_bus] w_addr_ex;
    output reg[`aluop_bus] aluop_ex;
    output reg[`alusel_bus] alusel_ex;

    always @(posedge clk) begin
        if (rst==`rst_enable) begin
            ope_data_1_ex <= `zero_32;
            ope_data_2_ex <= `zero_32;
            w_en_ex <= `w_disable;
            w_addr_ex <= `zero_5;
            aluop_ex <= `EXE_NOP_O;
            alusel_ex <= `alusel_nop;
        end else begin
            ope_data_1_ex <= ope_data_1_de;
            ope_data_2_ex <= ope_data_2_de;
            w_en_ex <= w_en_de;
            w_addr_ex <= w_addr_de;
            aluop_ex <= aluop_de;
            alusel_ex <= alusel_de;
        end
    end


endmodule
