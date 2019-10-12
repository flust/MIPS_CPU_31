`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/18 18:32:10
// Design Name: 
// Module Name: alu
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


module ALU(a,b,aluc,r,zero,carry,negative,overflow);
	input [31:0] a;
	input [31:0] b;
	input [3:0] aluc;
	output reg [31:0] r;
	output reg zero,carry,negative,overflow;
	wire [31:0] ADDU,ADD,SUBU,SUB,AND,OR,XOR,NOR,LUI,SLT,SLTU,SRA,SLA,SRL;
	assign ADDU=a+b;
	assign ADD=a+b;
	assign SUBU=a-b;
	assign SUB=a-b;
	assign AND=a&b;
	assign OR=a|b;
	assign XOR=a^b;
	assign NOR=~(a|b);
	assign LUI={b[15:0],16'b0};
	assign SLT=($signed(a)<$signed(b))?1:0;
	assign SLTU=(a<b)?1:0;
	assign SRA=($signed(b))>>>a;
	assign SLA=b<<a;
	assign SRL=b>>a;
	always @(*)
	begin
	casex(aluc)
		4'b0000:
        begin 
            r=ADDU; 
            zero=(r==0)?1:0;
            if(r<a||r<b)carry=1;
            else carry=0;
            negative=r[31];
		end
		4'b0010:
        begin
            r=ADD;
            zero=(r==0)?1:0;
            negative=r[31];
            overflow=0;
            if(a[31]==1&&b[31]==1&&r[31]==0)overflow=1;
            if(a[31]==0&&b[31]==0&&r[31]==1)overflow=1;
		end
		4'b0001:
        begin
            r=SUBU;
            zero=(r==0)?1:0;
            if(a<b)carry=1;
            else carry=0;
            negative=r[31];
		end
		4'b0011:
        begin 
            r=SUB;
            zero=(r==0)?1:0;
            negative=r[31];
            overflow=0;
            if(a[31]==1&&b[31]==0&&r[31]==0)overflow=1;
            if(a[31]==0&&b[31]==1&&r[31]==1)overflow=1;
        end
		4'b0100:
        begin
            r=AND;
            zero=(r==0)?1:0;
            negative=r[31];
		end
		4'b0101:
        begin
            r=OR;
            zero=(r==0)?1:0;
            negative=r[31];
        end
		4'b0110:
        begin
            r=XOR;
            zero=(r==0)?1:0;
            negative=r[31];
        end
        4'b0111:
        begin 
            r=NOR;
            zero=(r==0)?1:0;
            negative=r[31];
        end
		4'b100x:
        begin
            r=LUI;
            zero=(r==0)?1:0;
            negative=r[31];
        end
		4'b1011:
        begin
            r=SLT;
            zero=(a==b)?1:0;
            negative=(a<b)?1:0;
		end
		4'b1010:
        begin
            r=SLTU;
            zero=(a==b)?1:0;
            if(a<b)carry=1;
            else carry=0;
            negative=r[31];
		end
		4'b1100:
        begin
            r=SRA;
            zero=(r==0)?1:0;
            negative=r[31];
            if(a>0&&a<33)carry=b[a-1];
            else if(a>32)carry=b[31];
        end
		4'b111x:
        begin
            r=SLA;
            zero=(r==0)?1:0;
            negative=r[31];
            if(a>0&&a<33)carry=b[32-a];
            else if(a>32)carry=0;
        end
		4'b1101:
        begin
            r=SRL;
            zero=(r==0)?1:0;
            negative=r[31];
            if(a>0&&a<33)carry=b[a-1];
            else if(a>32)carry=0;
        end
	endcase
	end
endmodule
