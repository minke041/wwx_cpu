`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/05 14:40:05
// Design Name: 
// Module Name: tb_decode_main
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


module tb_decode_main;





// decode_main Inputs
reg clk = 0;
reg   [31:0] fetch_addr          = 0 ;
reg   [31:0] inst                 = 0 ;
reg   rst                                  = 0 ;
reg   [31:0] r_data_1         = 0 ;
reg   [31:0] r_data_2         = 0 ;
reg   mem_w_en                             = 0 ;
reg   [4:0] mem_w_addr       = 0 ;
reg   [31:0] mem_w_data       = 0 ;
reg   ex_w_en                              = 0 ;
reg  [4:0] ex_w_addr        = 0 ;
reg   [31:0] ex_w_data        = 0 ;

// decode_main Outputs
wire  r_en_1                               ;
wire  r_en_2                               ;
wire [4:0] r_addr_1         ;
wire  [4:0] r_addr_2         ;
wire  [7:0] aluop               ;
wire  [3:0] alusel             ;
wire  w_en_de                              ;
wire  [4:0] w_addr_de        ;
wire  [31:0] ope_data_1       ;
wire  [31:0] ope_data_2       ;


initial
begin
    forever 
        begin  
            #10 clk=~clk;
            #100 rst= ~rst;
        end

end

always @(posedge clk) begin
    inst = inst + 1;

end

decode_main  u_decode_main (
    .fetch_addr     (fetch_addr      ),
    . inst            ( inst             ),
    .rst                             ( rst                              ),
    . r_data_1    ( r_data_1     ),
    . r_data_2    (  r_data_2     ),
    .mem_w_en                        ( mem_w_en                         ),
    .mem_w_addr  (  mem_w_addr   ),
    . mem_w_data  (  mem_w_data   ),
    .ex_w_en                         ( ex_w_en                          ),
    . ex_w_addr   ( ex_w_addr    ),
    .ex_w_data   ( ex_w_data    ),

    .r_en_1                          ( r_en_1                           ),
    .r_en_2                          ( r_en_2                           ),
    .r_addr_1    ( r_addr_1     ),
    .r_addr_2    ( r_addr_2     ),
    .aluop          (aluop           ),
    .alusel        (alusel         ),
    .w_en_de                         ( w_en_de                          ),
    .w_addr_de   (w_addr_de    ),
    .ope_data_1  (ope_data_1   ),
    .ope_data_2  (ope_data_2   )
);

initial
begin

    #1000 $finish;
end

endmodule