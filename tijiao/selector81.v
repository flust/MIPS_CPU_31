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


module selector81(iC0,iC1,iC2,iC3,iC4,iC5,iC6,iC7,iS2,iS1,iS0,oZ);
    input [31:0] iC0;
    input [31:0] iC1;
    input [31:0] iC2;
    input [31:0] iC3;
    input [31:0] iC4;
    input [31:0] iC5;
    input [31:0] iC6;
    input [31:0] iC7;
    input iS2;
    input iS1;
    input iS0;
    output [31:0]oZ;
    reg [31:0]oZ;
    always@(iC0 or iC1 or iC2 or iC3 or iC4 or iC5 or iC6 or iC7 or iS2 or iS1 or iS0)
    case({iS2,iS1,iS0})
        3'b000:oZ=iC0;
        3'b001:oZ=iC1;
        3'b010:oZ=iC2;
        3'b011:oZ=iC3;
        3'b100:oZ=iC4;
        3'b101:oZ=iC5;
        3'b110:oZ=iC6;
        3'b111:oZ=iC7;
    endcase
endmodule
