`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2023 02:16:02 PM
// Design Name: 
// Module Name: multiplexor
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


module multiplexor
    #(parameter width =5)
    (input wire [width-1:0] in0,in1,
    input wire sel,
    output [width-1:0] mux_out
    );

    assign mux_out = sel ? in1 : in0;
endmodule
