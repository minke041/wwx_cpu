`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/12 12:02:41
// Design Name: 
// Module Name: ctrl
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
module ctrl(
    rst,
    stall_req_de,
    stall_req_ex,
    stall 
    );
    input wire rst;
    input wire stall_req_de;
    input wire stall_req_ex;
    output wire[`stall_bus] stall;

    assign stall = (rst==`rst_enable)?`stall_no:
                   (stall_req_de==`stall_req_enable)?`stall_de:
                   (stall_req_ex==`stall_req_enable)?`stall_ex:
                   `stall_no;


endmodule
