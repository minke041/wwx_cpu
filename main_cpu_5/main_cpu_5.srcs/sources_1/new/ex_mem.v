`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/06 15:52:17
// Design Name: 
// Module Name: ex_mem
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
module ex_mem(
    clk,
    rst,
    w_en_ex,
    w_addr_ex,
    w_data_ex,
    w_data_mem,
    w_addr_mem,
    w_en_mem
    );
    input wire clk;
    input wire rst;
    input wire w_en_ex;
    input wire[`reg_addr_bus] w_addr_ex;
    input wire[`reg_data_bus] w_data_ex;
    output reg w_en_mem;
    output reg[`reg_addr_bus] w_addr_mem;
    output reg[`reg_data_bus] w_data_mem;

    always @(posedge clk) begin
        if (rst==`rst_enable) begin
            w_en_mem <= `w_disable;
            w_addr_mem <= `zero_5;
            w_data_mem <= `zero_32;
        end else begin
            w_en_mem <= w_en_ex;
            w_addr_mem <= w_addr_ex;
            w_data_mem <= w_data_ex;
        end
    end

endmodule
