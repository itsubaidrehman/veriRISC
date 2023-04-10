`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2023 02:22:55 PM
// Design Name: 
// Module Name: driver
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


module driver
#(parameter width = 8)
    (input wire [width-1:0] data_in,
    input wire data_en,
    output [width-1:0] data_out
    );
    assign data_out = data_en ? data_in : 1'bz;
endmodule
