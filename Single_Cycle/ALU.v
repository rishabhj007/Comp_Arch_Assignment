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
	 input [7:0] PC_Out,
    input ALU_OP,
	 input Branch,
    output reg [7:0] Ans
    );
	 
	 reg [7:0] inp;
	 
	 always@(Read_Data,PC_Out,Branch)
	 begin
		if(Branch == 1)
			inp = PC_Out;
		else
			inp = Read_Data;
	 end
	 
	 always@(inp,ALU_OP,Imm_Extend)
	 begin
		case(ALU_OP)
		1'b0: Ans = inp + Imm_Extend;
		1'b1: Ans = inp << Imm_Extend[2:0];
		default: Ans = 0;
		endcase
	 end

endmodule
