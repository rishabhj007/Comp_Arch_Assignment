`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:12:21 04/13/2021 
// Design Name: 
// Module Name:    CPU 
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
module CPU(
    input Clk,
    input Reset
    );
	 
	 wire [7:0] Instr_Code, IF_ID_Instr_Code, REG_Read_Data, REG_Imm_Extend,
					 EX_WB_Write_Data, ID_EX_Read_Data, ID_EX_Imm_Extend, ALU_Result;
					 
	 wire [2:0] ID_EX_RD, EX_WB_RD;
	 
	 wire EX_WB_Reg_Write, ID_EX_Reg_Write, ID_EX_ALU_OP, REG_ALU_OP, REG_Reg_Write;
	 
	 
	 Instruction_Fetch IF_Module(Clk, Reset, Instr_Code); // The instruction fetch module
	 
	 IF_ID_Reg REG_1(Clk, Reset, Instr_Code, IF_ID_Instr_Code);  //IF-ID register
	 
	 Register Register_Module(IF_ID_Instr_Code, ID_EX_RD, EX_WB_RD, EX_WB_Write_Data, 
	 EX_WB_Reg_Write, Reset, REG_Read_Data, REG_Imm_Extend); // Decode Module
	 
	 Control_Unit Control_Module(IF_ID_Instr_Code[7:6], REG_ALU_OP, REG_Reg_Write); //Control Module
	 
	 ID_EX_Reg REG_2(Clk, Reset, REG_Reg_Write, REG_ALU_OP, REG_Read_Data, REG_Imm_Extend,
	 IF_ID_Instr_Code[5:3], ID_EX_Reg_Write, ID_EX_ALU_OP, ID_EX_Read_Data, ID_EX_Imm_Extend, ID_EX_RD);
	 
	 ALU ALU_Module(ID_EX_Read_Data, ID_EX_Imm_Extend, ID_EX_RD, EX_WB_Write_Data, EX_WB_RD,
	 EX_WB_Reg_Write, ID_EX_ALU_OP, ALU_Result); 	//Execution module
	 
	 EX_WB_Reg REG_3(Clk, Reset, ID_EX_Reg_Write, ID_EX_RD, ALU_Result, EX_WB_Reg_Write,
	 EX_WB_RD, EX_WB_Write_Data); //EX-WB register

endmodule
