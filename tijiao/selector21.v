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


module selector21(iC0,iC1,iS0,oZ);
    input [31:0] iC0;
    input [31:0] iC1;
    input iS0;
    output [31:0]oZ;
    reg [31:0]oZ;
    always@(iC0 or iC1 or iS0)
    begin
    case(iS0)
    	0:oZ=iC0;
    	1:oZ=iC1;
    endcase
    end
endmodule
