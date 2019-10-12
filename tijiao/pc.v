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

module pc(clk,reset,ena,iData,oData);
    input clk;
    input [31:0]iData;
    input ena;
    input reset;
    output wire [31:0]oData;
    reg [31:0]data=32'b0000_0000_0100_0000_0000_0000_0000_0000;
    always@(negedge clk or posedge reset)
    begin
        if(reset==1)data<=32'b0000_0000_0100_0000_0000_0000_0000_0000;
        else 
            begin
                if(ena)data<=iData;
            end
    end
    assign oData=data;
    
endmodule