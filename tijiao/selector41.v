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


module selector41(iC0,iC1,iC2,iC3,iS1,iS0,oZ);
    input [31:0] iC0;
    input [31:0] iC1;
    input [31:0] iC2;
    input [31:0] iC3;
    input iS1;
    input iS0;
    output [31:0]oZ;
    reg [31:0]oZ;
    always@(iC0 or iC1 or iC2 or iC3 or iS1 or iS0)
    begin
    case({iS1,iS0})
    2'b00:oZ=iC0;
    2'b01:oZ=iC1;
    2'b10:oZ=iC2;
    2'b11:oZ=iC3;
    endcase
    end
endmodule
