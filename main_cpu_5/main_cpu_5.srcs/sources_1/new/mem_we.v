`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/06 20:29:25
// Design Name: 
// Module Name: mem_we
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
module mem_we(
    clk,
    rst,
    w_en_mem,
    w_addr_mem,
    w_data_mem,
    hilo_w_en_mem,
    hi_w_data_mem,
    lo_w_data_mem,
    hilo_w_en_mem_we,
    hi_w_data_mem_we,
    lo_w_data_mem_we,
    w_en,
    w_addr,
    w_data,
    stall 
    );
    input wire clk;
    input wire rst;
    input wire w_en_mem;
    input wire[`reg_addr_bus] w_addr_mem;
    input wire[`reg_data_bus] w_data_mem;
    input wire[`stall_bus] stall;

    input wire hilo_w_en_mem;
    input wire[`reg_data_bus] hi_w_data_mem;
    input wire[`reg_data_bus] lo_w_data_mem;
    output reg hilo_w_en_mem_we;
    output reg[`reg_data_bus] hi_w_data_mem_we;
    output reg[`reg_data_bus] lo_w_data_mem_we;

    output reg w_en;
    output reg[`reg_addr_bus] w_addr;
    output reg[`reg_data_bus] w_data;

    always @(posedge clk ) begin
        if (rst==`rst_enable) begin
            w_en <= `w_disable;
            w_addr <= `zero_5;
            w_data <= `zero_32;
            hilo_w_en_mem_we <= `w_disable;
            hi_w_data_mem_we <= `zero_32;
            lo_w_data_mem_we <= `zero_32;
        end else if (stall[4]==`stall_enable&&stall[5]==`stall_disable) begin
            w_en <= `w_disable;
            w_addr <= `zero_5;
            w_data <= `zero_32;
            hilo_w_en_mem_we <= `w_disable;
            hi_w_data_mem_we <= `zero_32;
            lo_w_data_mem_we <= `zero_32;
        end else if(stall[4]==`stall_disable) begin
            w_en <= w_en_mem;
            w_addr <= w_addr_mem;
            w_data <= w_data_mem;
            hilo_w_en_mem_we <= hilo_w_en_mem;
            hi_w_data_mem_we <= hi_w_data_mem;
            lo_w_data_mem_we <= lo_w_data_mem;
        end
            
    end

endmodule
