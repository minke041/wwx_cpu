`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/06 20:20:27
// Design Name: 
// Module Name: Acc_memory
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
module Acc_memory(
    rst,
    w_data,
    w_addr,
    w_en,
    w_data_mem,
    w_addr_mem,
    w_en_mem
    );
    input wire rst;
    input wire w_en;
    input wire[`reg_addr_bus] w_addr;
    input wire[`reg_data_bus] w_data;
    output wire w_en_mem;
    output wire[`reg_addr_bus] w_addr_mem;
    output wire[`reg_data_bus] w_data_mem;

    assign w_en_mem = (rst==`rst_enable)?`w_disable:w_en;
    assign w_addr_mem = (rst==`rst_enable)?`zero_5:w_addr;
    assign w_data_mem = (rst==`rst_enable)?`zero_32:w_data;



endmodule
