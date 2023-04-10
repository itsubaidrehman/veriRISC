`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2023 05:32:04 PM
// Design Name: 
// Module Name: controller
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


module controller(
        input wire clk, rst, zero, phase,
        input wire [2:0] opcode,
        output reg sel, rd, ld_ir, halt, inc_pc, ld_ac, ld_pc, wr, data_e
    );
    
    parameter HLT = 3'b000, SKZ = 3'b001, ADD = 3'b010, AND = 3'b011, XOR = 3'b100, LDA = 3'b101, STO = 3'b110, JMP = 3'b111;
    
    parameter inst_addr = 8, inst_fetch = 9, inst_load = 10, idle = 11, op_addr = 12, op_fetch = 13,
    alu_op = 14, store = 15;
    reg [2:0] PS, NS;
    
    
    reg aluop;
    always @(opcode)
        begin
            case(opcode)
                ADD: aluop = 1;
                AND : aluop = 1;
                XOR : aluop = 1;
                LDA : aluop = 1;
            default : aluop = 0;
            endcase
        end
    
    
    always @(posedge clk)
        begin
        if (rst)
        PS <= inst_addr;
        else 
        PS <= NS;
        end
        
        always @(PS)
        begin 
            case(PS)
                inst_addr: 
                begin
                NS <= inst_fetch;
                sel = 1; rd = 0; ld_ir = 0; halt = 0; inc_pc = 0; ld_ac = 0; ld_pc = 0; wr = 0; data_e = 0;
                end
                
                inst_fetch: 
                begin
                NS <= inst_load;
                sel = 1; rd = 1; ld_ir = 0; halt = 0; inc_pc = 0; ld_ac = 0; ld_pc = 0; wr = 0; data_e = 0;
                end
                    
                inst_load: 
                begin
                NS <= idle;
                sel = 1; rd = 1; ld_ir = 1; halt = 0; inc_pc = 0; ld_ac = 0; ld_pc = 0; wr = 0; data_e = 0;
                end
                
                idle: 
                begin
                NS <= op_addr;
                sel = 1; rd = 1; ld_ir = 1; halt = 0; inc_pc = 0; ld_ac = 0; ld_pc = 0; wr = 0; data_e = 0;
                end
                
                op_addr: 
                begin
                NS <= op_fetch;
                sel = 0; rd = 0; ld_ir = 0; halt = HLT; inc_pc = 1; ld_ac = 0; ld_pc = 0; wr = 0; data_e = 0;
                end
                
                op_fetch: 
                begin
                NS <= alu_op;
                sel = 1; rd = aluop; ld_ir = 0; halt = 0; inc_pc = 0; ld_ac = 0; ld_pc = 0; wr = 0; data_e = 0;
                end
                
                alu_op: 
                begin
                NS <= store;
                sel = 1; rd = aluop; ld_ir = 0; halt = 0; inc_pc = SKZ && zero; ld_ac = 0; ld_pc = JMP; wr = 0; data_e = STO;
                end
                
                store: 
                begin
                NS <= inst_addr;
                sel = 1; rd = aluop; ld_ir = 0; halt = 0; inc_pc = 0; ld_ac = aluop; ld_pc = JMP; wr = STO; data_e = STO;
                end
            endcase
        end
endmodule
