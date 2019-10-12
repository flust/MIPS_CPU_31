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


module S_Ext18(iData,oData);
    input [17:0] iData;
    output [31:0]oData;
    wire [31:0]oData;
    assign oData=iData[17]==1?{14'b11111111111111,iData}:{14'b0,iData};
endmodule
