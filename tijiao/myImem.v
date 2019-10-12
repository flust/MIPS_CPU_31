`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/01 19:01:00
// Design Name: 
// Module Name: selector41
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module iram(clk,ena,wena,rena,addr,data_in,data_out);
	input clk;
	input ena;
	input wena;
	input rena;
	input [31:0] addr;
	input [31:0] data_in;
	output reg [31:0] data_out;
	reg [31:0] data[0:1023];
	always @(*)
	begin
		if(ena==0) data_out<=32'bz;
		else 
		begin
			if(wena==1)data[addr]<=data_in;
			if(rena==1)data_out<=data[addr];
		end
	end
endmodule

module myImem(
	input clk,
	input ena,
	input wena,
	input rena,
    input [31:0]pc,
    output wire[31:0]Instruction
);
//iram iram1(.clk(clk),.ena(ena),.wena(wena),.rena(rena),.addr(pc),.data_in(0),.data_out(Instruction));
imem imem1(pc,Instruction);


endmodule


