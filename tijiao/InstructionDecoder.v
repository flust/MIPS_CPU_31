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
`define ADD_flag  31'b1000_0000_0000_0000_0000_0000_0000_000
`define ADDU_flag 31'b0100_0000_0000_0000_0000_0000_0000_000
`define SUB_flag  31'b0010_0000_0000_0000_0000_0000_0000_000
`define SUBU_flag 31'b0001_0000_0000_0000_0000_0000_0000_000
`define AND_flag  31'b0000_1000_0000_0000_0000_0000_0000_000
`define OR_flag   31'b0000_0100_0000_0000_0000_0000_0000_000
`define XOR_flag  31'b0000_0010_0000_0000_0000_0000_0000_000
`define NOR_flag  31'b0000_0001_0000_0000_0000_0000_0000_000
`define SLT_flag  31'b0000_0000_1000_0000_0000_0000_0000_000
`define SLTU_flag 31'b0000_0000_0100_0000_0000_0000_0000_000
`define SLL_flag  31'b0000_0000_0010_0000_0000_0000_0000_000
`define SRL_flag  31'b0000_0000_0001_0000_0000_0000_0000_000
`define SRA_flag  31'b0000_0000_0000_1000_0000_0000_0000_000
`define SLLV_flag 31'b0000_0000_0000_0100_0000_0000_0000_000
`define SRLV_flag 31'b0000_0000_0000_0010_0000_0000_0000_000
`define SRAV_flag 31'b0000_0000_0000_0001_0000_0000_0000_000
`define JR_flag   31'b0000_0000_0000_0000_1000_0000_0000_000
`define ADDI_flag 31'b0000_0000_0000_0000_0100_0000_0000_000
`define ADDIU_flag 31'b0000_0000_0000_0000_0010_0000_0000_000
`define ANDI_flag 31'b0000_0000_0000_0000_0001_0000_0000_000
`define ORI_flag  31'b0000_0000_0000_0000_0000_1000_0000_000
`define XORI_flag 31'b0000_0000_0000_0000_0000_0100_0000_000
`define LUI_flag  31'b0000_0000_0000_0000_0000_0010_0000_000
`define LW_flag   31'b0000_0000_0000_0000_0000_0001_0000_000
`define SW_flag   31'b0000_0000_0000_0000_0000_0000_1000_000
`define BEQ_flag  31'b0000_0000_0000_0000_0000_0000_0100_000
`define BNE_flag  31'b0000_0000_0000_0000_0000_0000_0010_000
`define SLTI_flag 31'b0000_0000_0000_0000_0000_0000_0001_000
`define SLTIU_flag 31'b0000_0000_0000_0000_0000_0000_0000_100
`define J_flag    31'b0000_0000_0000_0000_0000_0000_0000_010
`define JAL_flag  31'b0000_0000_0000_0000_0000_0000_0000_001


module InstructionDecoder(
	input clk,
	input [31:0] Instruction,
	input reset,
	input zero,
	output reg PC_CLK,
    output reg IM_R,
	output reg [1:0]M1,
    output reg [3:0]aluc,
    output reg [2:0]M2,
    output reg RF_W,
    output reg RF_CLK,
    output reg [1:0]M3,
    output reg CS,
    output reg DM_R,
    output reg DM_W,
    output reg M4,
    output reg [1:0]M5
);
reg [30:0] control;
wire [5:0] op;
wire [5:0] func;
assign op=Instruction[31:26];
assign func=Instruction[5:0];

always@(*)
begin
    if(reset)
        begin
            PC_CLK<=0;
            IM_R<=0;
            M1<=2'b00;
            aluc<=4'b0000;
            M2<=3'b100;
            RF_W<=0;
            RF_CLK<=0;
            M3<=2'b00;
            CS<=0;
            DM_R<=0;
            DM_W<=0;
            M4<=0;
            M5<=2'b0;
        end
    else
    begin
	case(op)
	6'b000000:
		begin
			PC_CLK<=1;
			IM_R<=1;
			M1<=2'b00;
			M2<=3'b000;
			RF_W<=1;
			RF_CLK<=1;
			M3<=2'b00;
			CS<=0;
			DM_R<=0;
			DM_W<=0;
			M5<=2'b00;
			case(func)
			6'b100000:
				begin
					control<=`ADD_flag;
					aluc<=4'b0010;
					M4<=0;
				end
			6'b100001:
				begin
					control<=`ADDU_flag;
					aluc<=4'b0000;
					M4<=0;
				end
			6'b100010:
				begin
					control<=`SUB_flag;
					aluc<=4'b0011;
					M4<=0;
				end
			6'b100011:
				begin
					control<=`SUBU_flag;
					aluc<=4'b0001;
					M4<=0;
				end
			6'b100100:
				begin
					control<=`AND_flag;
					aluc<=4'b0100;
					M4<=0;
				end
			6'b100101:
				begin
					control<=`OR_flag;
					aluc<=4'b0101;
					M4<=0;
				end
			6'b100110:
				begin
					control<=`XOR_flag;
					aluc<=4'b0110;
					M4<=0;
				end
			6'b100111:
				begin
					control<=`NOR_flag;
					aluc<=4'b0111;
					M4<=0;
				end

			6'b101010:
				begin
					control<=`SLT_flag;
					aluc<=4'b1011;
					M4<=0;
				end
			6'b101011:
				begin
					control<=`SLTU_flag;
					aluc<=4'b1010;
					M4<=0;
				end
			6'b000000:
				begin
					control<=`SLL_flag;
					aluc<=4'b1110;//111x
					M4<=1;
				end
			6'b000010:
				begin
					control<=`SRL_flag;
					aluc<=4'b1101;
					M4<=1;
				end
			6'b000011:
				begin
					control<=`SRA_flag;
					aluc<=4'b1100;
					M4<=1;
				end
			6'b000100:
				begin
					control<=`SLLV_flag;
					aluc<=4'b1111;//111x
					M4<=0;
				end
			6'b000110:
				begin
					control<=`SRLV_flag;
					aluc<=4'b1101;
					M4<=0;
				end
			6'b000111:
				begin
					control<=`SRAV_flag;
					aluc<=4'b1100;
					M4<=0;
				end
			6'b001000:
				begin
					control<=`JR_flag;
					M1[0]<=1;
					RF_W<=0;
					RF_CLK<=0;
				end
			default:
                       begin
                               PC_CLK<=0;
                               IM_R<=0;
                               M1<=2'b00;
                               aluc<=4'b0000;
                               M2<=3'b100;
                               RF_W<=0;
                               RF_CLK<=0;
                               M3<=2'b00;
                               CS<=0;
                               DM_R<=0;
                               DM_W<=0;
                               M4<=0;
                               M5<=2'b0;
                       end
			endcase
		end
	6'b001000:
			begin
				control<=`ADDI_flag;
				PC_CLK<=1;
				IM_R<=1;
				M1<=2'b00;
				aluc<=4'b0010;
				M2<=3'b000;
				RF_W<=1;
				RF_CLK<=1;
				M3<=2'b01;
				CS<=0;
				DM_R<=0;
				DM_W<=0;
				M4<=0;
				M5<=2'b01;
			end
	6'b001001:
			begin
				control<=`ADDIU_flag;
				PC_CLK<=1;
				IM_R<=1;
				M1<=2'b00;
				aluc<=4'b0010;
				M2<=3'b000;
				RF_W<=1;
				RF_CLK<=1;
				M3<=2'b01;
				CS<=0;
				DM_R<=0;
				DM_W<=0;
				M4<=0;
				M5<=2'b01;
			end
	6'b001100:
			begin
				control<=`ANDI_flag;
				PC_CLK<=1;
				IM_R<=1;
				M1<=2'b00;
				aluc<=4'b0100;
				M2<=3'b000;
				RF_W<=1;
				RF_CLK<=1;
				M3<=2'b01;
				CS<=0;
				DM_R<=0;
				DM_W<=0;
				M4<=0;
				M5<=2'b10;
			end
	6'b001101:
			begin
				control<=`ORI_flag;
				PC_CLK<=1;
				IM_R<=1;
				M1<=2'b00;
				aluc<=4'b0101;
				M2<=3'b000;
				RF_W<=1;
				RF_CLK<=1;
				M3<=2'b01;
				CS<=0;
				DM_R<=0;
				DM_W<=0;
				M4<=0;
				M5<=2'b10;
			end
	6'b001110:
			begin
				control<=`XORI_flag;
				PC_CLK<=1;
				IM_R<=1;
				M1<=2'b00;
				aluc<=4'b0110;
				M2<=3'b000;
				RF_W<=1;
				RF_CLK<=1;
				M3<=2'b01;
				CS<=0;
				DM_R<=0;
				DM_W<=0;
				M4<=0;
				M5<=2'b10;
			end
	6'b001111:
			begin
				control<=`LUI_flag;
				PC_CLK<=1;
				IM_R<=1;
				M1<=2'b00;
				aluc<=4'b1000;//100x
				M2<=3'b000;
				RF_W<=1;
				RF_CLK<=1;
				M3<=2'b01;
				CS<=0;
				DM_R<=0;
				DM_W<=0;
				M4<=0;
				M5<=2'b10;
			end
	6'b100011:
			begin
				control<=`LW_flag;
				PC_CLK<=1;
				IM_R<=1;
				M1<=2'b00;
				aluc<=4'b0010;
				M2<=3'b001;
				RF_W<=1;
				RF_CLK<=1;
				M3<=2'b01;
				CS<=1;
				DM_R<=1;
				DM_W<=0;
				M4<=0;
				M5<=2'b01;
			end
	6'b101011:
			begin
				control<=`SW_flag;
				PC_CLK<=1;
				IM_R<=1;
				M1<=2'b00;
				aluc<=4'b0010;
				M2<=3'b001;
				RF_W<=0;
				RF_CLK<=0;
				M3<=2'b01;
				CS<=1;
				DM_R<=0;
				DM_W<=1;
				M4<=0;
				M5<=2'b01;
			end
	6'b000100:
			begin
				control<=`BEQ_flag;
				PC_CLK<=1;
				IM_R<=1;
				if(zero==1)M1<=2'b10;
				else M1<=2'b00;
				aluc<=4'b0011;
				M2<=3'b001;
				RF_W<=0;
				RF_CLK<=0;
				M3<=2'b00;
				CS<=0;
				DM_R<=0;
				DM_W<=0;
				M4<=0;
				M5<=2'b00;
			end
	6'b000101:
			begin
				control<=`BNE_flag;
				PC_CLK<=1;
				IM_R<=1;
				if(zero!=1)M1<=2'b10;
				else M1<=2'b00;
				aluc<=4'b0011;
				M2<=3'b001;
				RF_W<=0;
				RF_CLK<=0;
				M3<=2'b00;
				CS<=0;
				DM_R<=0;
				DM_W<=0;
				M4<=0;
				M5<=2'b00;
			end
	6'b001010:
			begin
				control<=`SLTI_flag;
				PC_CLK<=1;
				IM_R<=1;
				M1<=2'b00;
				aluc<=4'b1011;
				M2<=3'b000;
				RF_W<=1;
				RF_CLK<=1;
				M3<=2'b01;
				CS<=0;
				DM_R<=0;
				DM_W<=0;
				M4<=0;
				M5<=2'b01;
			end
	6'b001011:
			begin
				control<=`SLTIU_flag;
				PC_CLK<=1;
				IM_R<=1;
				M1<=2'b00;
				aluc<=4'b1010;
				M2<=3'b000;
				RF_W<=1;
				RF_CLK<=1;
				M3<=2'b01;
				CS<=0;
				DM_R<=0;
				DM_W<=0;
				M4<=0;
				M5<=2'b10;
			end
	6'b000010:
			begin
				control<=`J_flag;
				PC_CLK<=1;
				IM_R<=1;
				M1<=2'b11;
				//aluc<=4'b1010;
				//M2<=3'b011;
				RF_W<=0;
				RF_CLK<=0;
				//M3<=2'b01;
				CS<=0;
				DM_R<=0;
				DM_W<=0;
				//M4<=2'b00;
				//M5<=2'b10;
			end
	6'b000011:
			begin
				control<=`JAL_flag;
				PC_CLK<=1;
				IM_R<=1;
				M1<=2'b11;
				//aluc<=4'b1010;
				M2<=3'b100;
				RF_W<=1;
				RF_CLK<=1;
				M3<=2'b10;
				CS<=0;
				DM_R<=0;
				DM_W<=0;
				//M4<=2'b00;
				//M5<=2'b10;
			end
	default:
	   begin
	           PC_CLK<=0;
               IM_R<=0;
               M1<=2'b00;
               aluc<=4'b0000;
               M2<=3'b100;
               RF_W<=0;
               RF_CLK<=0;
               M3<=2'b00;
               CS<=0;
               DM_R<=0;
               DM_W<=0;
               M4<=0;
               M5<=2'b0;
	   end
	endcase
	end
end
endmodule