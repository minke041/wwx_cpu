`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/10 22:38:48
// Design Name: 
// Module Name: hilo
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
module hilo(
    rst,
    clk,
    hilo_w_en,
    hi_w_data,
    lo_w_data,
    hi_r_data,
    lo_r_data
    );
    input wire rst;
    input wire clk;
    input wire hilo_w_en;
    input wire[`reg_data_bus] hi_w_data;
    input wire[`reg_data_bus] lo_w_data;
    output wire[`reg_data_bus] hi_r_data;
    output wire[`reg_data_bus] lo_r_data;

    reg[`reg_data_bus] reg_hi;
    reg[`reg_data_bus] reg_lo;


    always @(posedge clk) begin
        if (rst==`rst_enable) begin
            reg_hi <= `zero_32;
            reg_lo <= `zero_32;
        end else if(rst==`rst_disable||hilo_w_en==`w_enable) begin
            reg_hi <= hi_w_data;
            reg_lo <= lo_w_data;
        end
    end

    assign hi_r_data = (rst==`rst_enable)?`zero_32:reg_hi;
    assign lo_r_data = (rst==`rst_enable)?`zero_32:reg_lo;




endmodule
