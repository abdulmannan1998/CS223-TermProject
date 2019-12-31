`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/27/2019 05:38:05 AM
// Design Name: 
// Module Name: ResetButton
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


module ResetButton(input clk, load, [2:0] done,
                  output load_out);
                  
    logic outt1;
    
    logic [28:0] count1 = 29'd0;
    
    assign load_out = outt1;
    
    always_ff@(posedge clk)
    begin
        outt1 <= 0;
        if(done == 3'd4 || done == 3'd5)
        begin
            if(count1 < 29'd400000000 && load == 1)
            begin
                count1 <= count1 + 1;
            end
            else if(load == 0) begin
                count1 <= 0;
            end
            else if (load == 1) begin
                outt1 <= 1;
                count1 <= 0;
            end
       end    
    end
    
endmodule
