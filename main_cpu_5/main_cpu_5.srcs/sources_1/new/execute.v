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
    rst,
    ope_data_1_ex,
    ope_data_2_ex,
    w_en,
    w_addr,
    aluop_ex,
    alusel_ex,
    w_data_ex,
    w_en_ex,
    w_addr_ex,
    hi_r_data_hilo,
    lo_r_data_hilo,
    hi_w_data_mem,
    lo_w_data_mem,
    hilo_w_en_mem,
    hi_w_data_we,
    lo_w_data_we,
    hilo_w_en_we,
    hilo_w_en_ex,
    hi_w_data_ex,
    lo_w_data_ex
    );
    input wire rst;
    input wire[`reg_data_bus] ope_data_1_ex;
    input wire[`reg_data_bus] ope_data_2_ex;
    input wire w_en;
    input wire[`reg_addr_bus] w_addr;
    input wire[`aluop_bus] aluop_ex;
    input wire[`alusel_bus] alusel_ex;

    input wire[`reg_data_bus] hi_r_data_hilo;
    input wire[`reg_data_bus] lo_r_data_hilo;
    input wire hilo_w_en_mem;
    input wire[`reg_data_bus] hi_w_data_mem;
    input wire[`reg_data_bus] lo_w_data_mem;
    input wire hilo_w_en_we;
    input wire[`reg_data_bus] hi_w_data_we;
    input wire[`reg_data_bus] lo_w_data_we;

    output wire w_en_ex;
    output wire[`reg_addr_bus] w_addr_ex;
    output wire[`reg_data_bus] w_data_ex;

    output wire[`reg_data_bus] hi_w_data_ex;
    output wire[`reg_data_bus] lo_w_data_ex;
    output wire hilo_w_en_ex;

    wire w_en_mid=w_en;
    wire[`reg_addr_bus] w_addr_mid=w_addr;
    wire[`reg_data_bus] w_data_mid;
    
    wire[`reg_data_bus] w_data_logic;
    wire[`reg_data_bus] w_data_shift;
    wire[`reg_data_bus] w_data_move;

    wire[`reg_data_bus] hi_r_data;
    wire[`reg_data_bus] lo_r_data;
    wire[`hilo_inform_width] hilo_inform_move;
    wire[`hilo_inform_width] hilo_inform_arthmetic;




    get_hilo_data get_hilo_data0(
    .hi_r_data_hilo(hi_r_data_hilo),
    .lo_r_data_hilo(lo_r_data_hilo),
    .hi_w_data_mem(hi_w_data_mem),
    .lo_w_data_mem(lo_w_data_mem),
    .hilo_w_en_mem(hilo_w_en_mem),
    .hi_w_data_we(hi_w_data_we),
    .lo_w_data_we(lo_w_data_we),
    .hilo_w_en_we(hilo_w_en_we),
    .hi_r_data(hi_r_data),
    .lo_r_data(lo_r_data)
    );

    exe_logic exe_logic0(
    .ope_data_1(ope_data_1_ex),
    .ope_data_2(ope_data_2_ex),
    .aluop(aluop_ex),
    .w_data_logic(w_data_logic)
    );

    exe_shift exe_shift0(
    .ope_data_1(ope_data_1_ex),
    .ope_data_2(ope_data_2_ex),
    .aluop(aluop_ex),
    .w_data_shift(w_data_shift)
    );

    exe_move exe_move0(
    .ope_data_1(ope_data_1_ex),
    .ope_data_2(ope_data_2_ex),
    .aluop(aluop_ex),
    .hi_r_data(hi_r_data),
    .lo_r_data(lo_r_data),
    .hilo_inform_move(hilo_inform_move),
    .w_data_move(w_data_move)
    );

    exe_choi exe_choi0(
    .alusel(alusel_ex),
    .w_data_logic(w_data_logic),
    .w_data_shift(w_data_shift),
    .w_data_move(w_data_move),
    .w_data(w_data_mid)
    );

    hilo_inform_choi hilo_inform_choi0(
    .hilo_inform_move(hilo_inform_move),
    .hilo_inform_arthmetic(hilo_inform_arthmetic),
    .alusel(alusel_ex),
    .hilo_w_en_ex(hilo_w_en_ex),
    .hi_w_data_ex(hi_w_data_ex),
    .lo_w_data_ex(lo_w_data_ex)
    );

    assign w_en_ex = (rst==`rst_enable)?`w_disable:w_en_mid;
    assign w_addr_ex = (rst==`rst_enable)?`zero_5:w_addr_mid;
    assign w_data_ex = (rst==`rst_enable)?`zero_32:w_data_mid;

endmodule
