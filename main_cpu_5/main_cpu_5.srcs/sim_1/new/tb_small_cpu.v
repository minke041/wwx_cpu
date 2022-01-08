`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/07 12:50:38
// Design Name: 
// Module Name: tb_small_cpu
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


module tb_small_cpu();
    reg clk=0;
    reg rst=0;
    reg[31:0] inst=32'b0;
    
    initial begin
        inst[31:26] = 6'b0;
        inst[5:0] = 6'b100100;
        forever begin
            #10 clk = ~clk;
        end
    end

    always @(posedge clk ) begin
        inst[25:21] <= inst[25:21]+1;
        inst[20:16] <= inst[20:16]+1;
        inst[15:11] <= inst[15:11]+1;
    end

    small_cpu small_cpu0(
    .clk(clk),
    .rst(rst),
    .inst(inst),
    .fetch_en_o(),
    .fetch_addr_o()
    );

    initial begin
        #1000 $finish;
    end



endmodule
