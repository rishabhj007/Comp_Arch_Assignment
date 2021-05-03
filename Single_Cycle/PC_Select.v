`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:27:11 04/11/2021 
// Design Name: 
// Module Name:    PC_Select 
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
module PC_Select(
    input [7:0] PC_Out,
    input [7:0] Write_Data,
    input Branch,
	 input Clk,
	 input Reset,
    output reg [7:0] PC
    );
	 
	 always@(negedge Clk, negedge Reset)
	 begin
	 if(Reset == 0)
	 PC <= 0;
	 else
		 begin
			if(Branch == 1'b0)
				PC <= PC_Out;
			else
				PC <= Write_Data;
		 end
	 end

endmodule
