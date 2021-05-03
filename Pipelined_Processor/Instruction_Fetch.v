`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:56:34 02/25/2021 
// Design Name: 
// Module Name:    Instruction_Fetch 
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
module Instruction_Fetch(
    input Clk,
    input Reset,
    output reg [7:0] Instr_Code
    );
	 
	 
reg [7:0] PC;
reg [7:0] Mem [7:0];

always@(negedge Clk)
begin
if(Instr_Code[7:6] == 2'b11)
	PC <= PC + 1'b1 + {{2{Instr_Code[5]}}, Instr_Code[5:0]};
else
	PC <= PC + 1'b1;
end

always@(posedge Clk)
Instr_Code <= Mem[PC];

always@(negedge Reset)
begin
if(Reset == 0)
	begin
	
	Mem[3]=8'b11000001; Mem[2]=8'b00011100; Mem[1]=8'b01110001; Mem[0]=8'b00110011;
	
	Mem[7]=8'b00000001; Mem[6]=8'b00001011; Mem[5]=8'b00000010; Mem[4]=8'b01011011;
	
	PC <= 0;
	end
end
endmodule
