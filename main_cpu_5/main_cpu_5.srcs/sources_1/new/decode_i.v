`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/08 12:51:51
// Design Name: 
// Module Name: decode_i
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
module decode_i(
    inst,
    inform_i,
    is_class_i
    );
    input wire[`inst_bus] inst;
    output wire[`inform_width] inform_i;
    output wire is_class_i;

    wire[5:0] fun=inst[31:26];
    wire[`reg_addr_bus] rs=inst[25:21];
    wire[`reg_addr_bus] rt=inst[20:16];
    wire[`reg_addr_bus] rd=inst[15:11];
    wire[`reg_addr_bus] sh=inst[10:6];
    wire[15:0] immediate = inst[15:0];
    
    assign is_class_i = (fun==`EX_ANDI||fun==`EX_XORI||fun==`EX_LUI||fun==`EX_ORI)?`it_is:`it_is_not;

    wire[`reg_data_bus] imme = (fun==`EX_ANDI||fun==`EX_XORI||fun==`EX_ORI)?{16'b0,immediate[15:0]}:(fun==`EX_LUI)?{immediate[15:0],16'b0}:`zero_32;

    wire r_en_1 = (fun==`EX_ANDI||fun==`EX_XORI||fun==`EX_ORI)?`r_enable:`r_disable;

    wire[`reg_addr_bus] r_addr_1 = (fun==`EX_ANDI||fun==`EX_XORI||fun==`EX_ORI)?rs:`zero_5;

    wire r_en_2 = `r_disable;

    wire[`reg_addr_bus] r_addr_2 = `zero_5;
 
    wire w_en = (fun==`EX_ANDI||fun==`EX_XORI||fun==`EX_ORI||fun==`EX_LUI)?`w_enable:`w_disable;
    wire[`reg_addr_bus] w_addr = (fun==`EX_ANDI||fun==`EX_XORI||fun==`EX_ORI||fun==`EX_LUI)?rt:`zero_5;


   assign inform_i[`inform_width]={r_en_1,r_addr_1[`reg_addr_bus],r_en_2,r_addr_2[`reg_addr_bus],imme[`reg_data_bus],w_en,w_addr[`reg_addr_bus],fun[5:0]};

endmodule
