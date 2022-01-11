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
    hilo_w_en_ex_mem,
    hi_w_data_ex_mem,
    lo_w_data_ex_mem,
    hilo_w_en_mem,
    hi_w_data_mem,
    lo_w_data_mem,
    w_data_mem,
    w_addr_mem,
    w_en_mem
    );
    input wire rst;
    input wire w_en;
    input wire[`reg_addr_bus] w_addr;
    input wire[`reg_data_bus] w_data;

    input wire hilo_w_en_ex_mem;
    input wire[`reg_data_bus] hi_w_data_ex_mem;
    input wire[`reg_data_bus] lo_w_data_ex_mem;

    output wire w_en_mem;
    output wire[`reg_addr_bus] w_addr_mem;
    output wire[`reg_data_bus] w_data_mem;

    output wire hilo_w_en_mem;
    output wire[`reg_data_bus] hi_w_data_mem;
    output wire[`reg_data_bus] lo_w_data_mem;

    assign w_en_mem = (rst==`rst_enable)?`w_disable:w_en;
    assign w_addr_mem = (rst==`rst_enable)?`zero_5:w_addr;
    assign w_data_mem = (rst==`rst_enable)?`zero_32:w_data;

    assign hilo_w_en_mem = hilo_w_en_ex_mem;
    assign hi_w_data_mem = hi_w_data_ex_mem;
    assign lo_w_data_mem = lo_w_data_ex_mem;



endmodule
