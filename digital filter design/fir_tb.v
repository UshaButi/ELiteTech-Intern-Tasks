`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:EliteTech Intern 
// Engineer:UshaButi 
// 
// Create Date: 07.06.2025 01:23:20
// Design Name: 
// Module Name: fir_filter_tb
// Project Name: DIGITAL FIR
// Target Devices: 
// Tool Versions: 
// Description: DESIGN AND SIMULATE A DIGITAL FIR (FINITE
//IMPULSE RESPONSE) FILTER USING VERILOG OR MATLAB. 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fir_filter_tb;

    parameter N = 16;

reg clk, reset;
reg [N-1:0] data_in;
wire [N-1:0] data_out; 

fir_filter inst0(clk, reset, data_in, data_out);

// input sine wave data
initial
$readmemb("signal.data", RAMM);

// Create the RAM
reg [N-1:0] RAMM [31:0]; 

// create a clock
initial 
clk = 0;
always 
#10 clk = ~ clk;  

// Read RAMM data and give to design
always@(posedge clk)
    data_in <= RAMM[Address]; 
    
// Address counter
reg [4:0] Address; 
initial
Address = 1; 
always@(posedge clk)
begin
    if (Address == 31)
        Address = 0; 
    else
        Address = Address + 1; 
end     

endmodule

