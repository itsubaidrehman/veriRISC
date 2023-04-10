`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2023 10:22:50 PM
// Design Name: 
// Module Name: memory
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


module memory
    #(parameter AWIDTH = 5, DWIDTH = 8)
    (input wire [AWIDTH -1 :0] addr,
    input wire clk, rd, wr,
    inout [DWIDTH - 1 : 0] data
    );

reg [7:0] mem [0:255];

always @(posedge clk)
    begin
        if (wr)
        mem[addr] <= data;
    end

    assign data = rd ? mem[addr] : data;




endmodule
