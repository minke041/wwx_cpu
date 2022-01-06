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

  always @(posedge clk) begin
      if (rst==`rst_enable) begin
        fetch_en <= `fetch_disable;
      end else begin
        fetch_en <= `fetch_enable;
      end 
  end

  always @(posedge clk) begin
      if (fetch_en==`fetch_disable) begin
        fetch_addr <= 32'b0;
      end else begin
        fetch_addr <= fetch_addr + 32'b100;
      end 
  end
endmodule
