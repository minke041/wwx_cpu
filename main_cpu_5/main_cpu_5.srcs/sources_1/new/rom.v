`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/09 09:18:31
// Design Name: 
// Module Name: rom
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
`define inst_mem_num 131071
`define inst_mem_num_log 17
`include "defines.v"
module rom(
    fetch_en,
    fetch_addr,
    inst 
    );
    input wire fetch_en;
    input wire[`inst_addr] fetch_addr;
    output wire[`inst_bus] inst;

    reg[`inst_bus] inst_mem[`inst_mem_num:0];
    initial $readmemh ("C:/Users/13773/Desktop/corn/inst_rom_data/5-1.data",inst_mem);
    assign inst = (fetch_en==`fetch_enable)?inst_mem[fetch_addr[`inst_mem_num_log+1:2]]:`zero_32;
endmodule
