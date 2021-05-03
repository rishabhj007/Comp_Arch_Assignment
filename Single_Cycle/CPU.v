`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:06:01 03/24/2021 
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
	 
	 wire[7:0] PC,Instr_Code,PC_Out,Write_Data,Read_Data,Imm_Extend;
	 wire ALU_OP,Reg_Write,Branch;
	 
	 Instruction_Fetch IF(Clk,Reset,PC,Instr_Code,PC_Out); // Block for fetching instruction from the memory
	 
	 Control_Unit CU(Instr_Code[7:6],Reset,ALU_OP,Reg_Write,Branch);  // Control unit which takes opcode and 
																							// generate all the control signals
	 
	 Register REG(Instr_Code[5:3],Write_Data,Read_Data,Reg_Write,Clk,Reset);  // Register access unit
	 
	 Sign_Extend IMM(Instr_Code[5:0],Branch,Imm_Extend); // Sign extend unit which extends the immediate data
		
	 ALU EXE(Read_Data,Imm_Extend,PC_Out,ALU_OP,Branch,Write_Data);  // ALU unit for addition or sll operation
	 
	 PC_Select MUX(PC_Out, Write_Data, Branch, Clk, Reset, PC);  // Final mux for selecting between PC+1 and 
																					 // PC+1+X, used in case of branch instruction

endmodule
