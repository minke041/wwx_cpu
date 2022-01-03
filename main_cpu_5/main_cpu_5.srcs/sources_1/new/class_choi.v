`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/03 18:40:58
// Design Name: 
// Module Name: class_choi
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
`define class_no 2'b00
`define class_r 2'b01 
`define class_i 2'b10 
`define class_j 2'b11



`include "defines.v"
module class_choi(
    inform_r,inform_i,inform_j,r_en_1,r_addr_1,r_en_2,r_addr_2,imme,aluop,w_en,w_addr,is_class_r,is_class_i,is_class_j
    );
    input wire[`inform_width] inform_r;
    input wire is_class_r;
    input wire[`inform_width] inform_i;
    input wire is_class_i;
    input wire[`inform_width] inform_j;
    input wire is_class_j;
    output wire r_en_1;
    output wire[`reg_addr_bus] r_addr_1;
    output wire r_en_2;
    output wire[`reg_addr_bus] r_addr_2;
    output wire[`reg_data_bus] imme;
    output wire[`aluop_bus] aluop;
    output wire w_en;
    output wire[`reg_addr_bus] w_addr;

   wire[1:0] class=(is_class_r)?`class_r:(is_class_i)?`class_i:(is_class_j)?`class_j:`class_no;
    wire[5:0] fun;

    assign {r_en_1,r_addr_1[`reg_addr_bus],r_en_2,r_addr_2[`reg_addr_bus],imme[`reg_data_bus],w_en,w_addr[`reg_addr_bus],fun[5:0]} = (class==`class_r)?inform_r:(class==`class_i)?inform_i:(class==`class_j)?inform_j:{56'b0};

    assign aluop = (class==`class_r)?{`class_r,fun[5:0]}:(class==`class_i)?{`class_i,fun[5:0]}:(class==`class_j)?{`class_j,fun[5:0]}:8'b0;

    
endmodule
