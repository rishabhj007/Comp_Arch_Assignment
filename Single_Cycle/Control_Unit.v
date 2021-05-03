`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:16:59 03/24/2021 
// Design Name: 
// Module Name:    Control_Unit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Control_Unit(
    input[1:0] OpCode,
	 input Reset,
    output reg ALU_OP,
    output reg Reg_Write,
	 output reg Branch
    );
	
	always@(OpCode)
	 begin
		case(OpCode)
		2'b00: begin
						Branch = 0; // Not a branch instruction and take only last 3 digits to expand
						ALU_OP = 0; // Simple Addition
						Reg_Write = 1; // WriteBack is Needed
				 end
		2'b01: begin
						Branch = 0; // Not a branch instruction and take only last 3 digits to expand
						ALU_OP = 1; // Logical shift left
						Reg_Write = 1; // WriteBack is Needed
				 end
		2'b11: begin
						Branch = 1; // A branch instruction and take the last 6 digits to expand
						ALU_OP = 0; // Simple Addition
						Reg_Write = 0; // WriteBack is Needed
				 end	
		default
				begin
						Branch = 0; // Not A branch instruction and take only last 3 digits to expand
						ALU_OP = 0; // Simple Addition
						Reg_Write = 0; // WriteBack is Needed
				end
		endcase
	 end

endmodule
