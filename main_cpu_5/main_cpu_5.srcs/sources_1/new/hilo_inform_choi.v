`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/11 15:08:08
// Design Name: 
// Module Name: hilo_inform_choi
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
module hilo_inform_choi(
    hilo_inform_move,
    hilo_inform_arthmetic,
    alusel,
    hilo_w_en_ex,
    hi_w_data_ex,
    lo_w_data_ex
    );
    input wire[`hilo_inform_width] hilo_inform_move;
    input wire[`hilo_inform_width] hilo_inform_arthmetic;
    input wire[`alusel_bus] alusel;
    output wire[`reg_data_bus] hi_w_data_ex;
    output wire[`reg_data_bus] lo_w_data_ex;
    output wire hilo_w_en_ex;

    assign {hilo_w_en_ex,hi_w_data_ex[`reg_data_bus],lo_w_data_ex[`reg_data_bus]} = (alusel==`alusel_move)?hilo_inform_move[`hilo_inform_width]:
                                                                                    (alusel==`alusel_arthmetic)?hilo_inform_arthmetic[`hilo_inform_width]:
                                                                                    {`w_disable,`zero_32,`zero_32};

endmodule
