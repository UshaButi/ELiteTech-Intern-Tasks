`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Sure ProEd 
// Engineer: Usha Buti
// 
// Create Date: 03.06.2025 13:19:16
// Design Name: 
// Module Name: pipelined_logic
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
module pipelined_logic(
    input i_clk,
    input i_reset,
    input [31:0]counter,
    output reg valid_out,
    output reg [31:0]count_EF_match
    );
    
	//initiaize registers
    reg[7:0]a_pipe1,b_pipe1,c_pipe1,d_pipe1;//stage1
    reg[7:0]bc_pipe2,a_pipe2,d_pipe2,e_pipe2;//stage2
    reg[7:0]f_pipe3,e_pipe3;//stage3
    
    always@(posedge i_clk or posedge i_reset)begin
     if(i_reset)begin
     a_pipe1<=0;
     b_pipe1<=0;
     c_pipe1<=0;
     d_pipe1<=0;
     end else begin
     a_pipe1<=counter[7:0];
     b_pipe1<=counter[15:8];
     c_pipe1<=counter[23:16];
     d_pipe1<=counter[31:24];
     end
     end
     
  always@(posedge i_clk or posedge i_reset) begin
       if(i_reset)begin
       bc_pipe2<=0;a_pipe2<=0;d_pipe2<=0;e_pipe2<=0;
       end else begin
       bc_pipe2<=b_pipe1&c_pipe1;
       a_pipe2<=a_pipe1;
       d_pipe2<=d_pipe1;
       e_pipe2<=a_pipe1^(b_pipe1&c_pipe1);
      end
      end
   

   always@(posedge i_clk or posedge i_reset )begin
   if(i_reset)begin
   f_pipe3<=0;e_pipe3<=0;
   count_EF_match=0;
   valid_out<=0;
   end else begin
     f_pipe3<=(bc_pipe2)^(a_pipe2|d_pipe2);
     e_pipe3<=e_pipe2;
     if(f_pipe3==e_pipe3)begin
     valid_out<=1'b1;
     count_EF_match<=count_EF_match+1'b1;
     end else begin
     valid_out<=1'b0;
     end
     end
     end 
endmodule