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

module regfile(clk,reset,we,raddr1,raddr2,waddr,wdata,rdata1,rdata2);
	input clk;//�½���д������
	input reset;//�첽��λ�źţ��ߵ�ƽʱ�Ĵ�������
	input we;//�ߵ�ƽʱ����д�룬�͵�ƽʱ�������
	input[4:0] raddr1,raddr2,waddr;//��ȡ���ݵĵ�ַ��д�����ݵĵ�ַ
	input [31:0] wdata;//д�������
	output wire [31:0] rdata1,rdata2;//��ȡ������
    reg[31:0]array_reg[31:0];
    always@(negedge clk or posedge reset)
    begin
    	if(reset==1)
    	begin
    		array_reg[0]<=32'b0;
    		array_reg[1]<=32'b0;
    		array_reg[2]<=32'b0;
    		array_reg[3]<=32'b0;
    		array_reg[4]<=32'b0;
    		array_reg[5]<=32'b0;
    		array_reg[6]<=32'b0;
    		array_reg[7]<=32'b0;
    		array_reg[8]<=32'b0;
    		array_reg[9]<=32'b0;
    		array_reg[10]<=32'b0;
    		array_reg[11]<=32'b0;
    		array_reg[12]<=32'b0;
    		array_reg[13]<=32'b0;
    		array_reg[14]<=32'b0;
    		array_reg[15]<=32'b0;
    		array_reg[16]<=32'b0;
    		array_reg[17]<=32'b0;
    		array_reg[18]<=32'b0;
    		array_reg[19]<=32'b0;
    		array_reg[20]<=32'b0;
    		array_reg[21]<=32'b0;
    		array_reg[22]<=32'b0;
    		array_reg[23]<=32'b0;
    		array_reg[24]<=32'b0;
    		array_reg[25]<=32'b0;
    		array_reg[26]<=32'b0;
    		array_reg[27]<=32'b0;
    		array_reg[28]<=32'b0;
    		array_reg[29]<=32'b0;
    		array_reg[30]<=32'b0;
    		array_reg[31]<=32'b0;
       	end
       	else
       	begin
       		if(we==1&&waddr!=0)array_reg[waddr]<=wdata;
       	end
    end
    assign rdata1=array_reg[raddr1];
    assign rdata2=array_reg[raddr2];
endmodule

