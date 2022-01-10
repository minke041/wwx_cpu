`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/06 23:33:05
// Design Name: 
// Module Name: small_cpu
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
module small_cpu(
    clk,
    rst,
    inst,
    fetch_en_o,
    fetch_addr_o
    );
    input wire clk;
    input wire rst;
    input wire[`inst_bus] inst;
    output wire fetch_en_o;
    output wire[`inst_addr] fetch_addr_o;

    //related to fetch and fe_de
    wire[`inst_addr] fetch_addr;

    assign fetch_addr_o = fetch_addr;

    fetch fetch0(
    .clk(clk),
    .rst(rst),
    .fetch_en(fetch_en_o),
    .fetch_addr(fetch_addr)
    );

    //related to fe_de and decode_main
    wire[`inst_bus] inst_de;
    wire[`inst_addr] fetch_addr_de;

    fe_de fe_de0(
    .inst_rom(inst),
    .fetch_addr_fe(fetch_addr),
    .rst(rst),
    .clk(clk),
    .inst_de(inst_de),
    .fetch_addr_de(fetch_addr_de)
    );

    //related to regfile 
    wire reg_r_en_1;
    wire[`reg_addr_bus] reg_r_addr_1;
    wire[`reg_data_bus] reg_r_data_1;
    wire reg_r_en_2;
    wire[`reg_addr_bus] reg_r_addr_2;
    wire[`reg_data_bus] reg_r_data_2;
    wire reg_w_en;
    wire[`reg_addr_bus] reg_w_addr;
    wire[`reg_data_bus] reg_w_data;

    Regfile Regfile0(
    .clk(clk),
    .w_addr(reg_w_addr),
    .w_data(reg_w_data),
    .w_en(reg_w_en),
    .r_addr_1(reg_r_addr_1),
    .r_en_1(reg_r_en_1),
    .r_addr_2(reg_r_addr_2),
    .r_en_2(reg_r_en_2),
    .r_data_1(reg_r_data_1),
    .r_data_2(reg_r_data_2)
    );

    //related to decode_main
    wire[`reg_data_bus] ope_data_1_de;
    wire[`reg_data_bus] ope_data_2_de;
    wire w_en_de;
    wire[`reg_addr_bus] w_addr_de;
    wire[`aluop_bus] aluop_de;
    wire[`alusel_bus] alusel_de;

    //memory inform 
    wire mem_w_en;
    wire[`reg_addr_bus] mem_w_addr;
    wire[`reg_data_bus] mem_w_data;

    //exe inform 
    wire ex_w_en;
    wire[`reg_addr_bus] ex_w_addr;
    wire[`reg_data_bus] ex_w_data;

    decode_main decode_main0(
    .fetch_addr(fetch_addr_de),
    .inst(inst_de),
    .rst(rst),
    .r_data_1(reg_r_data_1),
    .r_data_2(reg_r_data_2),
    .r_en_1(reg_r_en_1),
    .r_addr_1(reg_r_addr_1),
    .r_en_2(reg_r_en_2),
    .r_addr_2(reg_r_addr_2),
    .aluop(aluop_de),
    .alusel(alusel_de),
    .w_en_de(w_en_de),
    .w_addr_de(w_addr_de),
    .mem_w_en(mem_w_en),
    .mem_w_addr(mem_w_addr),
    .mem_w_data(mem_w_data),
    .ex_w_en(ex_w_en),
    .ex_w_addr(ex_w_addr),
    .ex_w_data(ex_w_data),
    .ope_data_1(ope_data_1_de),
    .ope_data_2(ope_data_2_de)
    );

    //related to de_ex and ex 
    wire[`reg_data_bus] de_ex_ope_data_1;
    wire[`reg_data_bus] de_ex_ope_data_2;
    wire de_ex_w_en;
    wire[`reg_addr_bus] de_ex_w_addr;
    wire[`aluop_bus] de_ex_aluop;
    wire[`alusel_bus] de_ex_alusel;

    de_ex de_ex0(
    .clk(clk),
    .rst(rst),
    .ope_data_1_de(ope_data_1_de),
    .ope_data_2_de(ope_data_2_de),
    .w_en_de(w_en_de),
    .w_addr_de(w_addr_de),
    .aluop_de(aluop_de),
    .alusel_de(alusel_de),
    .ope_data_1_ex(de_ex_ope_data_1),
    .ope_data_2_ex(de_ex_ope_data_2),
    .w_en_ex(de_ex_w_en),
    .w_addr_ex(de_ex_w_addr),
    .aluop_ex(de_ex_aluop),
    .alusel_ex(de_ex_alusel)
    );

    

    execute execute0(
    .rst(rst),
    .ope_data_1_ex(de_ex_ope_data_1),
    .ope_data_2_ex(de_ex_ope_data_2),
    .w_en(de_ex_w_en),
    .w_addr(de_ex_w_addr),
    .aluop_ex(de_ex_aluop),
    .alusel_ex(de_ex_alusel),
    .w_data_ex(ex_w_data),
    .w_en_ex(ex_w_en),
    .w_addr_ex(ex_w_addr)
    );
    //related to ex_mem
    wire ex_mem_w_en;
    wire[`reg_addr_bus] ex_mem_w_addr;
    wire[`reg_data_bus] ex_mem_w_data;

    ex_mem ex_mem0(
    .clk(clk),
    .rst(rst),
    .w_en_ex(ex_w_en),
    .w_addr_ex(ex_w_addr),
    .w_data_ex(ex_w_data),
    .w_data_mem(ex_mem_w_data),
    .w_addr_mem(ex_mem_w_addr),
    .w_en_mem(ex_mem_w_en)
    );

    Acc_memory Acc_memory0(
    .rst(rst),
    .w_data(ex_mem_w_data),
    .w_addr(ex_mem_w_addr),
    .w_en(ex_mem_w_en),
    .w_data_mem(mem_w_data),
    .w_addr_mem(mem_w_addr),
    .w_en_mem(mem_w_en)
    );

    mem_we mem_we0(
    .clk(clk),
    .rst(rst),
    .w_en_mem(mem_w_en),
    .w_addr_mem(mem_w_addr),
    .w_data_mem(mem_w_data),
    .w_en(reg_w_en),
    .w_addr(reg_w_addr),
    .w_data(reg_w_data)
    );



endmodule
