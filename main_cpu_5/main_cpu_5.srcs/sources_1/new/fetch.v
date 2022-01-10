`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/28 14:11:11
// Design Name: 
// Module Name: fetch
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
module fetch(
    clk,
    rst,
    fetch_en,
    fetch_addr
    );
    input wire clk;
    input wire rst;
    output reg fetch_en;
    output reg[`inst_addr] fetch_addr;

    reg[`inst_addr] fetch_addr_now;
    wire[`inst_addr] fetch_addr_next = fetch_addr + 4;
  always @(posedge clk) begin
      if (rst==`rst_enable) begin
        fetch_en <= `fetch_disable;
        fetch_addr <= `zero_32;
        fetch_addr_now <= `zero_32;
      end else begin
        fetch_en <= `fetch_enable;
        fetch_addr <= fetch_addr_now;
        fetch_addr_now <= fetch_addr_next;
      end 
  end

 
  
endmodule
