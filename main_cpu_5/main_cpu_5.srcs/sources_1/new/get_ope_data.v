`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/04 16:09:03
// Design Name: 
// Module Name: get_ope_data
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

module get_ope_data(
    imme,r_en,r_addr,r_data,mem_w_en,mem_w_addr,mem_w_data,ex_w_en,ex_w_addr,ex_w_data,ope_data
    );
    input wire[`reg_data_bus] imme;
    input wire r_en;
    input wire[`reg_addr_bus] r_addr;
    input wire[`reg_data_bus] r_data;
    input wire mem_w_en;
    input wire[`reg_addr_bus] mem_w_addr;
    input wire[`reg_data_bus] mem_w_data;
    input wire ex_w_en;
    input wire[`reg_addr_bus] ex_w_addr;
    input wire[`reg_data_bus] ex_w_data;
    output wire[`reg_data_bus] ope_data;

    assign ope_data = (r_en==`r_disable)?imme:(ex_w_en==`r_enable&&ex_w_addr==r_addr)?ex_w_data:(mem_w_en==`r_enable&&mem_w_addr==r_addr)?mem_w_data:r_data;
endmodule
