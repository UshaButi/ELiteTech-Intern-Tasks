`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:Sure ProEd  
// Engineer: Usha Buti
// 
// Create Date: 03.06.2025 13:22:19
// Design Name: 
// Module Name: pipelined_logic_tb
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
module pipelined_logic_tb;
    localparam tclk=10;
    reg clk;
    reg reset;
    reg [31:0] counter;
    wire valid_out;
    wire [31:0] count_EF_match;
    
    pipelined_logic P0(
    .i_clk(clk),
    .i_reset(reset),
    .counter(counter),
    .valid_out(valid_out),
    .count_EF_match(count_EF_match));
    
    initial clk=0;
    always #(tclk/2)clk<=~clk;
    
     initial begin
     reset=1;counter=0;
     #(tclk); reset=0;
     repeat(20)begin 
     @(posedge clk);
     counter=counter+1;
     end
     #20 $finish;
     end
  
endmodule