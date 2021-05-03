`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:02 03/25/2021 
// Design Name: 
// Module Name:    IF_ID_Reg 
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
module IF_ID_Reg(
input Clk,
input Reset,
input[7:0] Instr_Code,
output reg [7:0] IF_ID_Instr_Code
    );
	 
 always @ (posedge Clk, negedge Reset)
 begin
	 if(Reset == 0)
	 begin
		 IF_ID_Instr_Code <= 0;
	 end
	 
	 else
	 begin
		 IF_ID_Instr_Code <= Instr_Code;
	 end
 end
endmodule
