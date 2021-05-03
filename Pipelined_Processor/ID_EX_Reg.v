`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:25 03/25/2021 
// Design Name: 
// Module Name:    ID_EX_Reg 
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
module ID_EX_Reg(
input Clk,
input Reset,

input Reg_Write,
input ALU_OP,
input[7:0] Data1,
input[7:0] Data2,
input[2:0] RD,

output reg ID_EX_Reg_Write,
output reg ID_EX_ALU_OP,
output reg[7:0] ID_EX_Data1,
output reg[7:0] ID_EX_Data2,
output reg[2:0] ID_EX_RD
    );

always@(posedge Clk,negedge Reset)
begin
	if(Reset == 0)
	begin

	ID_EX_Reg_Write <= 0;
	ID_EX_ALU_OP <= 0;
	ID_EX_Data1 <= 0;
	ID_EX_Data2 <= 0;
	ID_EX_RD <= 0;

	end
	
	else
	begin

	ID_EX_Reg_Write <= Reg_Write;
	ID_EX_ALU_OP <= ALU_OP;
	ID_EX_Data1 <= Data1;
	ID_EX_Data2 <= Data2;
	ID_EX_RD <= RD;

	end

end

endmodule
