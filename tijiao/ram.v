`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/21 21:18:09
// Design Name: 
// Module Name: ram
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

module ram(clk,ena,wena,rena,addr,data_in,data_out);
	input clk;
	input ena;
	input wena;
	input rena;
	input [31:0] addr;
	input [31:0] data_in;
	output reg [31:0] data_out;
	reg [31:0] data[0:1023];
	always @(posedge clk)
	begin
		if(ena==0) data_out<=32'bz;
		else 
		begin
			if(wena==1)data[addr]<=data_in;
			if(rena==1)data_out<=data[addr];
		end
	end
endmodule
