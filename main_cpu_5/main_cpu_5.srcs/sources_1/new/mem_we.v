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
    w_en,
    w_addr,w_data
    );
    input wire clk;
    input wire rst;
    input wire w_en_mem;
    input wire[`reg_addr_bus] w_addr_mem;
    input wire[`reg_data_bus] w_data_mem;
    output reg w_en;
    output reg[`reg_addr_bus] w_addr;
    output reg[`reg_data_bus] w_data;

    always @(posedge clk ) begin
        if (rst==`rst_enable) begin
            w_en <= `w_disable;
            w_addr <= `zero_5;
            w_data <= `zero_32;
        end else begin
            w_en <= w_en_mem;
            w_addr <= w_addr_mem;
            w_data <= w_data_mem;
        end
            
    end

endmodule
