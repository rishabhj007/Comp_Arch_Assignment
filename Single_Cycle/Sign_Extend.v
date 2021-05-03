`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:51:39 04/09/2021 
// Design Name: 
// Module Name:    Sign_Extend 
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
module Sign_Extend(
    input [5:0] Instr_Code_5_0,
    input Control_Sig,
    output reg [7:0] Sign_Extended_Value
    );
	 	 
	 always @(Instr_Code_5_0,Control_Sig)
	 begin
	 if(Control_Sig == 1'b1)
		Sign_Extended_Value <= { {2{Instr_Code_5_0[5]}}, Instr_Code_5_0[5:0] };
	 else
		Sign_Extended_Value <= { {5{Instr_Code_5_0[2]}}, Instr_Code_5_0[2:0] };
	 end
	 
endmodule
