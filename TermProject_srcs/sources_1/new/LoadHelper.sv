`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2019 01:18:30 AM
// Design Name: 
// Module Name: LoadHelper
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


module LoadHelper(input clk, load, [2:0] done,
                  output load_out);
                  
    logic outt;
//    logic en;
    
    logic [26:0] count = 27'd0;
    
    assign load_out = outt;
    
    always_ff@(posedge clk)
    begin
        outt <= 0;
        if(done != 3'd4 || done != 3'd5)
        begin
//            if(!load) en = 1;
//            if(load && en) begin
//                outt = 1;
//                en = 0;
//            end
            if(count < 27'd50000000 && load == 1)
            begin
                count <= count + 1;
            end
            else if(load == 0) begin
                count <= 1'd0;
            end
            else if (load == 1) begin
                outt <= 1;
                count <= 1'd0;
            end
       end  
    end
endmodule
