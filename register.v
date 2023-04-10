`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2023 10:07:45 PM
// Design Name: 
// Module Name: register
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


module register
    #(parameter width = 8)
    (
    input wire [width - 1 : 0] data_in,
    input wire load, clk, rst,
    output reg [width - 1 : 0] data_out
    );


    always @(posedge clk)
    begin
        if(rst)
        data_out <= 0;
        else if (load)
        data_out <= data_in;
        else 
        data_out <= data_out;
    end

endmodule
