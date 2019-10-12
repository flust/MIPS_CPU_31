`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/22 08:41:18
// Design Name: 
// Module Name: Regfiles
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
module dram(clk,ena,wena,rena,addr,data_in,data_out);
	input clk;
	input ena;
	input wena;
	input rena;
	input [31:0] addr;
	input [31:0] data_in;
	output wire [31:0] data_out;
	reg [31:0] data[1023:0];
	always @(posedge clk)
	begin
		if(wena==1)data[addr-32'h10010000]<=data_in;
		//if(rena==1)data_out<=data[addr];
	end
	assign data_out=data[addr-32'h10010000];
endmodule

module Dmem(
	input clk,
	input ena,
	input wena,
	input rena,
	input[31:0]address,
	input wire [31:0]data_in,
	output wire [31:0]data_out
);
dram dram1(.clk(clk),.ena(ena),.wena(wena),.rena(rena),.addr(address),.data_in(data_in),.data_out(data_out));


endmodule