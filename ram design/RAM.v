`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: EliteTech
// Engineer:UshaButi 
// 
// Create Date: 06.06.2025 08:06:48
// Design Name: simple synchronous ram
// Module Name: simple_sync_ram
// Project Name: simple synchronous ram
// Target Devices: 
// Tool Versions: 
// Description:Create a simple synchronous RAM
//               with read/write capabilities. 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module simple_sync_ram(
    input clk,                   // Clock
    input we,                    // Write Enable
    input [3:0] addr,            // 4-bit address (0 to 15)
    input [7:0] din,             // Data input (8-bit)
    output reg [7:0] dout        // Data output (8-bit)
    );
    
    reg [7:0] mem [0:15];        // Declare 16 memory locations, each 8-bit wide
    
    always@(posedge clk)begin
        if (we)
            mem[addr] <= din     ;
        else
            dout       <= mem[addr];

    end
endmodule
