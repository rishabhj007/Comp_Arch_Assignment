`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:09:20 03/25/2021 
// Design Name: 
// Module Name:    EX_WB_Reg 
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
module EX_WB_Reg(
		input Clk,
		input Reset,
		
		input ID_EX_Reg_Write,
		input[2:0] ID_EX_RD,
		input[7:0] ALU_Result,

		output reg EX_WB_Reg_Write,
		output reg[2:0] EX_WB_RD,
		output reg[7:0] EX_WB_ALU_Result
		
    );
	 
		always@(posedge Clk,negedge Reset)
		begin
			if(Reset == 0)
			begin

			EX_WB_Reg_Write <= 0;
			EX_WB_RD <= 0;
			EX_WB_ALU_Result <= 0;

			end
			
			else
			begin

			EX_WB_Reg_Write <= ID_EX_Reg_Write;
			EX_WB_RD <= ID_EX_RD;
			EX_WB_ALU_Result <= ALU_Result;

			end

end


endmodule
