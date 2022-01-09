`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/06 12:35:24
// Design Name: 
// Module Name: exe_choi
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
module exe_choi(
    alusel,
    w_data_logic,
    w_data_shift,
    w_data
    );
    input wire[`alusel_bus] alusel;
    input wire[`reg_data_bus] w_data_logic;
    input wire[`reg_data_bus] w_data_shift;
    output wire[`reg_data_bus] w_data;

    assign w_data = (alusel==`alusel_logic)?w_data_logic:
                    (alusel==`alusel_shift)?w_data_shift:
                    `zero_32;

endmodule
