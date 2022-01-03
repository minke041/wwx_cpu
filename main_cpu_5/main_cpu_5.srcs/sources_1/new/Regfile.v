`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/03 09:27:58
// Design Name: 
// Module Name: Regfile
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


`define reg_number 32
`include "defines.v"
module Regfile(
    clk,w_addr,w_data,w_en,r_addr_1,r_en_1,
    r_addr_2,r_en_2,r_data_1,r_data_2
    );
    input wire clk;
    input wire[`reg_addr_bus] w_addr;
    input wire[`reg_data_bus] w_data;
    input wire w_en;
    input wire[`reg_addr_bus] r_addr_1;
    input wire r_en_1;
    input wire[`reg_addr_bus] r_addr_2;
    input wire r_en_2;
    output wire[`reg_data_bus] r_data_1;
    output wire[`reg_data_bus] r_data_2;
    reg[`reg_data_bus] regs[`reg_number-1:0];
    //write
    always @(posedge clk) begin
        if (w_en) begin
            regs[w_addr] <= w_data; 
        end 
    end
    //read
    assign r_data_1 = (r_en_1)?((r_addr_1 == 5'b0)?32'b0:(w_en||w_addr==r_addr_1)?w_data:regs[r_addr_1]):32'b0;
    assign r_data_2 = (r_en_2)?((r_addr_2 == 5'b0)?32'b0:(w_en||w_addr==r_addr_2)?w_data:regs[r_addr_2]):32'b0;
    
endmodule
