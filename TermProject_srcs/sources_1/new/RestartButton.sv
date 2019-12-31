`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/27/2019 03:06:34 PM
// Design Name: 
// Module Name: RestartButton
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


module RestartButton(input clk, load, [2:0] done,
                  output load_out);
                  
    logic outt2;
    
    logic [28:0] count2 = 29'd0;
    
    assign load_out = outt2;
    
    always_ff@(posedge clk)
    begin
        outt2 <= 0;
        if(done == 3'd4 || done == 3'd5)
        begin
            if(count2 < 29'd100000000 && load == 1)
            begin
                count2 <= count2 + 1;
            end
            else if(load == 0) begin
                count2 <= 0;
            end
            else if (load == 1) begin
                outt2 <= 1;
                count2 <= 0;
            end
       end    
    end
    
endmodule
