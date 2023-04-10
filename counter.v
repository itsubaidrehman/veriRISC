`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2023 10:52:16 PM
// Design Name: 
// Module Name: counter
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


module counter
    #(parameter width = 5) 
    (
    input wire [width - 1 : 0] cnt_in,
    input wire clk, load, rst, enab,
    output reg [width - 1 : 0] cnt_out
    );
    
    always @(posedge clk)
    begin
        if (rst)
            cnt_out <= 0;
        else if (load)
            cnt_out <= cnt_in;
        else if (enab)
            cnt_out <= cnt_out + 1;
        else 
            cnt_out <= cnt_out;
    end
endmodule
