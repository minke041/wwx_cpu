`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/11 11:23:57
// Design Name: 
// Module Name: get_hilo_data
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

module get_hilo_data(
    hi_r_data_hilo,
    lo_r_data_hilo,
    hi_w_data_mem,
    lo_w_data_mem,
    hilo_w_en_mem,
    hi_w_data_we,
    lo_w_data_we,
    hilo_w_en_we,
    hi_r_data,
    lo_r_data
    );
    input wire[`reg_data_bus] hi_r_data_hilo;
    input wire[`reg_data_bus] lo_r_data_hilo;
    input wire hilo_w_en_mem;
    input wire[`reg_data_bus] hi_w_data_mem;
    input wire[`reg_data_bus] lo_w_data_mem;
    input wire hilo_w_en_we;
    input wire[`reg_data_bus] hi_w_data_we;
    input wire[`reg_data_bus] lo_w_data_we;
    output wire[`reg_data_bus] hi_r_data;
    output wire[`reg_data_bus] lo_r_data;

    assign hi_r_data = (hilo_w_en_mem==`w_enable)?hi_w_data_mem:
                       (hilo_w_en_we==`w_enable)?hi_w_data_we:
                       hi_r_data_hilo;
    assign lo_r_data = (hilo_w_en_mem==`w_enable)?lo_w_data_mem:
                       (hilo_w_en_we==`w_enable)?lo_w_data_we:
                       lo_r_data_hilo;


endmodule
