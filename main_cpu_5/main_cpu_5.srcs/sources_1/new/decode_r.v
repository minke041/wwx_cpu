`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/03 10:30:36
// Design Name: 
// Module Name: decode_r
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
`define class_1 2'b01
`define class_2 2'b10 
`define class_3 2'b11 
`include "defines.v"
module decode_r(
    inst,
    inform_r,
    is_class_r
    );
    input wire[`inst_bus] inst;
    output wire[`inform_width] inform_r;
    output wire is_class_r;

    wire[5:0] op = inst[31:26];
    wire[`reg_addr_bus] rs=inst[25:21];
    wire[`reg_addr_bus] rt=inst[20:16];
    wire[`reg_addr_bus] rd=inst[15:11];
    wire[`reg_addr_bus] sh=inst[10:6];
    wire[5:0] fun=inst[5:0];
    
    assign is_class_r = (op==`special_op_1)?`it_is:`it_is_not;

    wire[1:0] class=(rs==5'b0)?`class_2:({rt,rd,sh}==15'b0)?`class_3:(sh==5'b0)?`class_1:`class_no;


    wire r_en_1 = (class==`class_no)?`r_disable:`r_enable;
    wire[`reg_addr_bus] r_addr_1 = (class==`class_1||class==`class_3)?rs:(class==`class_2)?rt:`zero_5;
    wire r_en_2=(class==`class_1)?`r_enable:`r_disable;
    wire[`reg_addr_bus] r_addr_2 = (class==`class_1)?rt:`zero_5;
    wire[`reg_data_bus] imme=(class==`class_2)?{27'b0,sh}:`zero_32;
    wire w_en = (class==`class_1||class==`class_2)?`w_enable:`w_disable;
    wire[`reg_addr_bus] w_addr = (class==`class_1||class==`class_2)?rd:`zero_5;

    assign inform_r[`inform_width]={r_en_1,r_addr_1[`reg_addr_bus],r_en_2,r_addr_2[`reg_addr_bus],imme[`reg_data_bus],w_en,w_addr[`reg_addr_bus],fun[5:0]};

    
endmodule
