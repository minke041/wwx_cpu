`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/09 14:58:52
// Design Name: 
// Module Name: tb_sopc
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


module tb_sopc();
    reg     clk=0;
  reg     rst=1;

  always #10 clk =~clk;
  always #1000 rst = ~rst;
  initial begin
    #10000 $finish;
  end
       
  
      
  
    sopc sopc0(
    .clk(clk),
    .rst(rst) 
    );

    
endmodule
