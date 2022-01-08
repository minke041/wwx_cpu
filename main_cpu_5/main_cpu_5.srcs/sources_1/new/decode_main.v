`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/05 10:08:33
// Design Name: 
// Module Name: decode_main
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
module decode_main(
    fetch_addr,
    inst,
    rst,
    r_data_1,
    r_data_2,
    r_en_1,
    r_addr_1,
    r_en_2,
    r_addr_2,
    aluop,
    alusel,
    w_en_de,
    w_addr_de,
    mem_w_en,
    mem_w_addr,
    mem_w_data,
    ex_w_en,
    ex_w_addr,
    ex_w_data,
    ope_data_1,
    ope_data_2
    );
    input wire[`inst_addr] fetch_addr;
    input wire[`inst_bus] inst;
    input wire rst;
    input wire[`reg_data_bus] r_data_1;
    input wire[`reg_data_bus] r_data_2;
    input wire mem_w_en;
    input wire[`reg_addr_bus] mem_w_addr;
    input wire[`reg_data_bus] mem_w_data;
    input wire ex_w_en;
    input wire[`reg_addr_bus] ex_w_addr;
    input wire[`reg_data_bus] ex_w_data;
    output wire r_en_1;
    output wire r_en_2;
    output wire[`reg_addr_bus] r_addr_1;
    output wire[`reg_addr_bus] r_addr_2;
    output wire[`aluop_bus] aluop;
    output wire[`alusel_bus] alusel;
    output wire w_en_de;
    output wire[`reg_addr_bus] w_addr_de;
    output wire[`reg_data_bus] ope_data_1;
    output wire[`reg_data_bus] ope_data_2;


    wire[`inform_width] inform_r;
    wire[`inform_width] inform_i;
    wire[`inform_width] inform_j;

    wire is_class_r;
    wire is_class_i;
    wire is_class_j;

    wire r_en_1_mid;
    wire r_en_2_mid;
    wire[`reg_addr_bus] r_addr_1_mid;
    wire[`reg_addr_bus] r_addr_2_mid;

    wire[`reg_data_bus] imme_mid;
    wire[`aluop_bus] aluop_mid;
    wire[`alusel_bus] alusel_mid;
    wire w_en_mid;
    wire[`reg_addr_bus] w_addr_mid;
    wire[`reg_data_bus] ope_data_1_mid;
    wire[`reg_data_bus] ope_data_2_mid;

    assign r_en_1 = (rst==`rst_enable)?`r_disable:r_en_1_mid;
    assign r_en_2 = (rst==`rst_enable)?`r_disable:r_en_2_mid;
    assign r_addr_1 = (rst==`rst_enable)?`zero_5:r_addr_1_mid;
    assign r_addr_2 = (rst==`rst_enable)?`zero_5:r_addr_2_mid;
    assign aluop = (rst==`rst_enable)?`EXE_NOP_O:aluop_mid;
    assign alusel = (rst==`rst_enable)?`alusel_nop:alusel_mid;
    assign w_en_de = (rst==`rst_enable)?`w_disable:w_en_mid;
    assign w_addr_de = (rst==`rst_enable)?`zero_5:w_addr_mid;
    assign ope_data_1 = (rst==`rst_enable)?`zero_32:ope_data_1_mid;
    assign ope_data_2 = (rst==`rst_enable)?`zero_32:ope_data_2_mid;


    
    

    decode_r decode_r0(
    .inst(inst),
    .inform_r(inform_r),
    .is_class_r(is_class_r)
    );

    decode_i decode_i0(
    .inst(inst),
    .inform_i(inform_i),
    .is_class_i(is_class_i)
    );

    class_choi class_choi0(
    .inform_r(inform_r),
    .inform_i(inform_i),
    .inform_j(inform_j),
    .r_en_1(r_en_1_mid),
    .r_addr_1(r_addr_1_mid),
    .r_en_2(r_en_2_mid),
    .r_addr_2(r_addr_2_mid),
    .imme(imme_mid),
    .aluop(aluop_mid),
    .w_en(w_en_mid),
    .w_addr(w_addr_mid),
    .is_class_r(is_class_r),
    .is_class_i(is_class_i),
    .is_class_j(is_class_j)
    );
   
    get_alusel get_alusel0(
    .inst(inst),
    .aluop(aluop_mid),
    .alusel(alusel_mid) 
    );

    get_ope_data get_ope_data0(
    .imme(imme_mid),
    .r_en(r_en_1_mid),
    .r_addr(r_addr_1_mid),
    .r_data(r_data_1),
    .mem_w_en(mem_w_en),
    .mem_w_addr(mem_w_addr),
    .mem_w_data(mem_w_data),
    .ex_w_en(ex_w_en),
    .ex_w_addr(ex_w_addr),
    .ex_w_data(ex_w_data),
    .ope_data(ope_data_1_mid)
    );

    get_ope_data get_ope_data1(
    .imme(imme_mid),
    .r_en(r_en_2_mid),
    .r_addr(r_addr_2_mid),
    .r_data(r_data_2),
    .mem_w_en(mem_w_en),
    .mem_w_addr(mem_w_addr),
    .mem_w_data(mem_w_data),
    .ex_w_en(ex_w_en),
    .ex_w_addr(ex_w_addr),
    .ex_w_data(ex_w_data),
    .ope_data(ope_data_2_mid)
    );

endmodule
