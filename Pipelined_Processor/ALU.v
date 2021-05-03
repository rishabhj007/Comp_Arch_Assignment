`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:02 02/04/2021 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [7:0] Read_Data,
    input [7:0] Imm_Extend,
	 input [2:0] RD,
	 input [7:0] Write_Data,
	 input [2:0] RS,
	 input Reg_Write,
    input ALU_OP,
    output reg [7:0] Ans
    );
	 
	 reg [7:0] inp;
	 
	 always@*
	 begin
		if(RS == RD && Reg_Write == 1'b1)
			inp = Write_Data;
		else
			inp = Read_Data;
		case(ALU_OP)
		1'b0: Ans = inp + Imm_Extend;
		1'b1: Ans = inp << Imm_Extend[2:0];
		default: Ans = 0;
		endcase
	 end

endmodule
