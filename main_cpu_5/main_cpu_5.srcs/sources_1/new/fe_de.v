`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/02 20:03:49
// Design Name: 
// Module Name: fe_de
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
module fe_de(
    inst_rom,
    fetch_addr_fe,
    rst,
    clk,
    inst_de,
    fetch_addr_de
    );
    input wire[`inst_bus] inst_rom;
    input wire[`inst_addr] fetch_addr_fe;
    input wire rst;
    input wire clk;
    output reg[`inst_bus] inst_de;
    output reg[`inst_addr] fetch_addr_de;

    always @(posedge clk) begin
        if (rst==`rst_enable) begin
            inst_de <= `zero_32;
            fetch_addr_de <= `zero_32;
        end else begin
            inst_de <= inst_rom;
            fetch_addr_de <= fetch_addr_fe;
        end
            
    end
endmodule
