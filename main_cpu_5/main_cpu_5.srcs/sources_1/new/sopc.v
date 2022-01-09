`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/06 21:03:34
// Design Name: 
// Module Name: sopc
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
module sopc(
    clk,
    rst 
    );
    input wire clk;
    input wire rst;

    wire fetch_en;
    wire[`inst_addr] fetch_addr;
    wire[`inst_bus] inst;

    rom rom0(
    .fetch_en(fetch_en),
    .fetch_addr(fetch_addr),
    .inst(inst) 
    );

    small_cpu small_cpu0(
    .clk(clk),
    .rst(rst),
    .inst(inst),
    .fetch_en_o(fetch_en),
    .fetch_addr_o(fetch_addr)
    );

endmodule
