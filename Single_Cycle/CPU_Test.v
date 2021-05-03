`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:24:47 04/11/2021
// Design Name:   CPU
// Module Name:   C:/Users/risha/Documents/Comp Arch project/Single_Cycle/CPU_Test.v
// Project Name:  Single_Cycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_Test;

	// Inputs
	reg Clk;
	reg Reset;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.Clk(Clk), 
		.Reset(Reset)
	);

	initial begin
	
		Clk = 0;
		Reset = 0;
		
		#20;
		
		Reset = 1;
		repeat(10)
		#20 Clk = ~Clk;
		$finish;

	end
      
endmodule

