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


module sccomp_dataflow(
	input clk_in,
	input reset,
	output wire [31:0]inst,
	output wire [31:0]pc
); 
wire[31:0]alu;
wire CS;
wire DM_W;
wire DM_R;
wire[31:0]Data_out;
wire[31:0]Data_in;

cpu sccpu(.clk_in(clk_in),.reset(reset),.inst(inst),.pc(pc),.CS(CS),.DM_W(DM_W),.DM_R(DM_R),.alu(alu),.Data_in(Data_in),.Data_out(Data_out));

Dmem Dmem1(.clk(clk_in),.ena(1),.wena(DM_W),.rena(DM_R),.address(alu),.data_in(Data_in),.data_out(Data_out));

myImem Imem1(.clk(clk_in),.ena(1),.wena(0),.rena(1),.pc((pc-32'b0000_0000_0100_0000_0000_0000_0000_0000)>>2),.Instruction(inst));
endmodule