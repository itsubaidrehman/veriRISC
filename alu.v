`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2023 03:54:37 PM
// Design Name: 
// Module Name: alu
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


module alu
#(parameter width = 8)
(
input wire [width - 1:0] in_a, in_b,
input wire [2:0] opcode,
output reg [width-1:0] alu_out,
output a_is_zero
    );
    assign a_is_zero = in_a ? 0 : 1;
    always @(*)
    begin
        case(opcode)
            3'b000, 3'b001, 3'b110, 3'b111 : alu_out = in_a;
            3'b101 : alu_out = in_b;
            3'b010 : alu_out = in_a + in_b;
            3'b011 : alu_out = in_a & in_b;
            3'b100 : alu_out = in_a ^ in_b;
            default : alu_out = in_a;
        endcase
    end
endmodule
