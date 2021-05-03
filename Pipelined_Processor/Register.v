`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:57:43 03/11/2021 
// Design Name: 
// Module Name:    Register 
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
module Register(
    input [7:0] Instr_Code,
	 input [2:0] ID_EX_RD,
	 input [2:0] EX_WB_RD,
    input [7:0] EX_WB_Write_Data,
    input EX_WB_Reg_Write,
    input Reset,
	 output reg [7:0] Read_Data,
	 output [7:0] Imm_Extend
    );
	 
	 reg[2:0] RS;
	 reg[7:0] RegFile[7:0]; 
	 
	 
	 always@* 
	 begin
			if(EX_WB_Reg_Write == 1)
			begin
				RegFile[EX_WB_RD] = EX_WB_Write_Data;
			end
			
			Read_Data = RegFile[Instr_Code[5:3]];
//			if(EX_WB_RD == Instr_Code[5:3])
	//			Read_Data = EX_WB_Write_Data;
		//	else
			//	Read_Data = RegFile[Instr_Code[5:3]];
	 end	 
	 
	 assign Imm_Extend = {{5{Instr_Code[2]}}, Instr_Code[2:0]};
	 
	 always@(negedge Reset)
	 begin
		if(Reset == 0)
		begin
			RegFile[0]=8'b00000000; RegFile[1]=8'b00000001; 
			RegFile[2]=8'b00000010; RegFile[3]=8'b00000011;
			RegFile[4]=8'b00000100; RegFile[5]=8'b00000101; 
			RegFile[6]=8'b00000110; RegFile[7]=8'b00000111;
		end
	end
	
	
endmodule
