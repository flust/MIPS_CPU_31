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


module cpu(
    input clk_in,
    input reset,
    input[31:0]inst,
    output wire [31:0]pc,
    output wire CS,
    output wire DM_W,
    output wire DM_R,
    input wire [31:0]Data_out,
    output wire[31:0]Data_in,
    output wire [31:0]alu
);
    wire PC_CLK;
    wire IM_R;
    wire RF_W;
    wire RF_CLK;

    wire[31:0]npc;
    wire[31:0]add;

    wire[31:0]parallel;
    wire[31:0]mux1;
    wire[31:0]mux2;
    wire[4:0]mux3;
    wire[31:0]mux4;
    wire[31:0]mux5;

    wire [1:0]M1;
    wire [2:0]M2;
    wire [1:0]M3;
    wire M4;
    wire [1:0]M5;


	wire [4:0] shamt;
	wire [15:0] imm16;
	wire [25:0] add26;
	wire [4:0] rsc;
	wire [4:0] rtc;
	wire [4:0] rdc;
	wire [31:0]rd;
	wire[31:0]rs;
	wire[31:0]rt;

    assign shamt=inst[10:6];
    assign imm16=inst[15:0];
    assign add26=inst[25:0];
    assign rsc=inst[25:21];
    assign rtc=inst[20:16];
    assign rdc=inst[15:11];

	wire [31:0]ext5;
	wire[31:0]ext16;
	wire[31:0]s_ext18;
	wire[31:0]s_ext16;

	wire [3:0]aluc;
	wire zero;
	wire carry;
	wire negative;
	wire overflow;
    wire [30:0]control;

    assign Data_in=rt;
    assign npc=pc+4;
    InstructionDecoder InstructionDecoder1(.clk(clk_in),.reset(reset),.Instruction(inst),.zero(zero),.PC_CLK(PC_CLK),.IM_R(IM_R),.M1(M1),.aluc(aluc),.M2(M2),.RF_W(RF_W),.RF_CLK(RF_CLK),.M3(M3),.CS(CS),.DM_R(DM_R),.DM_W(DM_W),.M4(M4),.M5(M5));

    regfile cpu_ref(.clk(clk_in),.reset(reset),.we(RF_W),.raddr1(rsc),.raddr2(rtc),.waddr(mux3),.wdata(mux2),.rdata1(rs),.rdata2(rt));

    ALU ALU1(.a(mux4),.b(mux5),.aluc(aluc),.r(alu),.zero(zero),.carry(carry),.negative(negative),.overflow(overflow));

    selector41 MUX1(.iC0(npc),.iC1(rs),.iC2(add),.iC3(parallel),.iS1(M1[1]),.iS0(M1[0]),.oZ(mux1));
    selector81 MUX2(.iC0(alu),.iC1(Data_out),.iC2(overflow),.iC3(carry),.iC4(npc),.iC5(0),.iC6(0),.iC7(0),.iS2(M2[2]),.iS1(M2[1]),.iS0(M2[0]),.oZ(mux2));//over carry 放到control�?
    selector41 MUX3(.iC0(rdc),.iC1(rtc),.iC2(31),.iC3(0),.iS1(M3[1]),.iS0(M3[0]),.oZ(mux3));
    selector21 MUX4(.iC0(rs),.iC1(ext5),.iS0(M4),.oZ(mux4));
    selector41 MUX5(.iC0(rt),.iC1(s_ext16),.iC2(ext16),.iC3(0),.iS1(M5[1]),.iS0(M5[0]),.oZ(mux5));

    Ext5 Ext5_1(.iData(shamt),.oData(ext5));
    Ext16 Ext16_1(.iData(imm16),.oData(ext16));
    S_Ext16 S_Ext16_1(.iData(imm16),.oData(s_ext16));
    S_Ext18 S_Ext18_1(.iData({imm16,2'b0}),.oData(s_ext18));
    
    pc pc1(.clk(clk_in),.reset(reset),.ena(1),.iData(mux1),.oData(pc));
    ADD add1(.a(npc),.b(s_ext18),.c(add));
    Parallel parallel1(.pc31_28(pc[31:28]),.imm26(add26),.parallel(parallel));

endmodule