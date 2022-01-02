`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/02 17:55:34
// Design Name: 
// Module Name: tb_pre_adder_4
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


module tb_pre_adder_4();
    reg[3:0] a=0;
    reg[3:0] b=0;
    reg pre_0=0;
    wire[3:0] sum;
    wire pre_4;
    reg clk=0;
    initial begin
        a=0;
        b=0;
        pre_0=0;
        forever begin
            #10 clk=~clk;
            #100 pre_0=~pre_0;
        end
    end
    always @(posedge clk) begin
        a =a+1;
        b =b+1;
    end

    pre_adder_4 pre_adder_40(
        .a(a),.b(b),.pre_0(pre_0),.sum(sum),.pre_4(pre_4)
    );
endmodule
