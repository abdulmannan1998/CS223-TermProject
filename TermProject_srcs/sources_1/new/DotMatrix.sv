`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2019 06:54:11 PM
// Design Name: 
// Module Name: DotMatrix
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


module DotMatrix(input clk, reset, btn1, btn2, btn3, btn4,
                 input [2:0] done,
                 input [63:0] register,
                 input integer cellgroups [7:0][7:0],
                 output [7:0] rowsOut,
                 output gameover,
                 output shcp, stcp, mr, oe, ds);
     
    logic [7:0][7:0] data_in;
    logic temp = 0;
    
    assign gameover = temp;
                 
    always_comb
        if(data_in == {64{1'b0}} && (done == 3'd4 || done == 3'd5)) temp = 1;
        else temp = 0;
    begin
        
    end
    
    always_ff@(posedge clk)
    begin
        if(done < 3'd4)
        begin
            data_in [7][7:0] = 8'd0;
            data_in [6][7:0] = 8'd0;
            data_in [5][7:0] = 8'd0;
            data_in [4][7:0] = 8'd0;
            data_in [3][7:0] = 8'd0;
            data_in [2][7:0] = 8'd0;
            data_in [1][7:0] = 8'd0;
            data_in [0][7:0] = 8'd0;
        end
        if(done == 3'd4)
        begin
            data_in [7][7:0] = register[63:56];
            data_in [6][7:0] = register[55:48];
            data_in [5][7:0] = register[47:40];
            data_in [4][7:0] = register[39:32];
            data_in [3][7:0] = register[31:24];
            data_in [2][7:0] = register[23:16];
            data_in [1][7:0] = register[15:8];
            data_in [0][7:0] = register[7:0];
        end
        
        if(btn1 && !temp)
        begin
            for(int i = 0; i < 8; i++)
            begin
                for(int k = 0; k < 8; k++)
                begin
                    if(cellgroups[i][k] == 1'd1)
                    begin
                        if(i == 7 && k == 7)
                        begin
                            if(data_in[7][6] == 1 && data_in[0][7] == 0 && data_in[7][0] == 0 && data_in[6][7] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[7][0] == 1 && data_in[0][7] == 0 && data_in[6][7] == 0 && data_in[7][6] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[7][6] == 1 && data_in[7][0] == 1 && data_in[0][7] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[0][7] == 1 && data_in[7][0] == 1 && data_in[6][7] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else data_in[i][k] = 0;
                        end
                        else if(i == 0 && k == 7)
                        begin
                            if(data_in[0][6] == 1 && data_in[1][7] == 0 && data_in[0][0] == 0 && data_in[7][7] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[0][0] == 1 && data_in[1][7] == 0 && data_in[7][7] == 0 && data_in[0][6] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[0][6] == 1 && data_in[0][0] == 1 && data_in[1][7] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[1][7] == 1 && data_in[0][0] == 1 && data_in[7][7] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else data_in[i][k] = 0;
                        end
                        else if(i == 7)
                        begin
                            if(data_in[7][k-1] == 1 && data_in[0][k] == 0 && data_in[6][k] == 0 && data_in[7][k+1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[7][k+1] == 1 && data_in[0][k] == 0 && data_in[6][k] == 0 && data_in[7][k-1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[7][k-1] == 1 && data_in[7][k+1] == 1 && data_in[0][k] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[0][k] == 1 && data_in[7][k+1] == 1 && data_in[6][k] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else data_in[i][k] = 0;
                        end
                        else if(i == 0)
                        begin
                            if(data_in[0][k-1] == 1 && data_in[1][k] == 0 && data_in[7][k] == 0 && data_in[0][k+1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[0][k+1] == 1 && data_in[1][k] == 0 && data_in[7][k] == 0 && data_in[0][k-1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[0][k-1] == 1 && data_in[0][k+1] == 1 && data_in[1][k] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[1][k] == 1 && data_in[0][k+1] == 1 && data_in[7][k] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else data_in[i][k] = 0;
                        end
                        else if(k == 7)
                        begin
                            if(data_in[i][6] == 1 && data_in[i+1][7] == 0 && data_in[i-1][7] == 0 && data_in[i][0] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i][0] == 1 && data_in[i+1][7] == 0 && data_in[i-1][7] == 0 && data_in[i][6] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i][6] == 1 && data_in[i][0] == 1 && data_in[i+1][7] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i+1][6] == 1 && data_in[i][0] == 1 && data_in[i-1][7] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else data_in[i][k] = 0;
                        end
                        else
                        begin
                            if(data_in[i][k-1] == 1 && data_in[i+1][k] == 0 && data_in[i-1][k] == 0 && data_in[i][k+1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i][k+1] == 1 && data_in[i+1][k] == 0 && data_in[i-1][k] == 0 && data_in[i][k-1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i][k-1] == 1 && data_in[i][k+1] == 1 && data_in[i+1][k] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i+1][k] == 1 && data_in[i][k+1] == 1 && data_in[i-1][k] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else data_in[i][k] = 0;
                        end
                    end
                end
            end
        end
        
        else if(btn2 && !temp)
        begin
            for(int i = 0; i < 8; i++)
            begin
                for(int k = 0; k < 8; k++)
                begin
                    if(cellgroups[i][k] == 2'd2)
                    begin
                        if(i == 7)
                        begin
                            if(data_in[7][k-1] == 1 && data_in[0][k] == 0 && data_in[6][k] == 0 && data_in[7][k+1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[7][k+1] == 1 && data_in[0][k] == 0 && data_in[6][k] == 0 && data_in[7][k-1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[7][k-1] == 1 && data_in[7][k+1] == 1 && data_in[0][k] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[0][k] == 1 && data_in[7][k+1] == 1 && data_in[6][k] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else data_in[i][k] = 0;
                        end
                        else if(k == 0)
                        begin
                            if(data_in[i][7] == 1 && data_in[i+1][0] == 0 && data_in[i-1][0] == 0 && data_in[i][1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i][1] == 1 && data_in[i+1][0] == 0 && data_in[i-1][0] == 0 && data_in[i][7] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i][7] == 1 && data_in[i][1] == 1 && data_in[i+1][0] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i+1][0] == 1 && data_in[i][1] == 1 && data_in[i-1][0] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else data_in[i][k] = 0;
                        end
                        else if(k == 7)
                        begin
                            if(data_in[i][6] == 1 && data_in[i+1][7] == 0 && data_in[i-1][7] == 0 && data_in[i][0] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i][0] == 1 && data_in[i+1][7] == 0 && data_in[i-1][7] == 0 && data_in[i][6] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i][6] == 1 && data_in[i][0] == 1 && data_in[i+1][7] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i+1][6] == 1 && data_in[i][0] == 1 && data_in[i-1][7] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else data_in[i][k] = 0;
                        end
                        else
                        begin
                            if(data_in[i][k-1] == 1 && data_in[i+1][k] == 0 && data_in[i-1][k] == 0 && data_in[i][k+1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i][k+1] == 1 && data_in[i+1][k] == 0 && data_in[i-1][k] == 0 && data_in[i][k-1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i][k-1] == 1 && data_in[i][k+1] == 1 && data_in[i+1][k] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i+1][k] == 1 && data_in[i][k+1] == 1 && data_in[i-1][k] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else data_in[i][k] = 0;
                        end
                    end
                end
            end
        end
        
        else if(btn3 && !temp)
        begin
            for(int i = 0; i < 8; i++)
            begin
                for(int k = 0; k < 8; k++)
                begin
                    if(cellgroups[i][k] == 2'd3)
                    begin
                        if(i == 7 && k == 0)
                        begin
                            if(data_in[7][7] == 1 && data_in[0][0] == 0 && data_in[6][0] == 0 && data_in[7][1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[7][1] == 1 && data_in[0][0] == 0 && data_in[6][0] == 0 && data_in[7][7] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[7][7] == 1 && data_in[7][1] == 1 && data_in[0][0] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[0][0] == 1 && data_in[7][1] == 1 && data_in[6][0] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else data_in[i][k] = 0;
                        end
                        else if(i == 7)
                        begin
                            if(data_in[7][k-1] == 1 && data_in[0][k] == 0 && data_in[6][k] == 0 && data_in[7][k+1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[7][k+1] == 1 && data_in[0][k] == 0 && data_in[6][k] == 0 && data_in[7][k-1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[7][k-1] == 1 && data_in[7][k+1] == 1 && data_in[0][k] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[0][k] == 1 && data_in[7][k+1] == 1 && data_in[6][k] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else data_in[i][k] = 0;
                        end
                        else if(k == 0)
                        begin
                            if(data_in[i][7] == 1 && data_in[i+1][0] == 0 && data_in[i-1][0] == 0 && data_in[i][1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i][1] == 1 && data_in[i+1][0] == 0 && data_in[i-1][0] == 0 && data_in[i][7] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i][7] == 1 && data_in[i][1] == 1 && data_in[i+1][0] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i+1][0] == 1 && data_in[i][1] == 1 && data_in[i-1][k] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else data_in[i][k] = 0;
                        end
                        else if(k == 7)
                        begin
                            if(data_in[i][6] == 1 && data_in[i+1][7] == 0 && data_in[i-1][7] == 0 && data_in[i][0] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i][0] == 1 && data_in[i+1][7] == 0 && data_in[i-1][7] == 0 && data_in[i][6] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i][6] == 1 && data_in[i][0] == 1 && data_in[i+1][7] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i+1][6] == 1 && data_in[i][0] == 1 && data_in[i-1][7] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else data_in[i][k] = 0;
                        end
                        else
                        begin
                            if(data_in[i][k-1] == 1 && data_in[i+1][k] == 0 && data_in[i-1][k] == 0 && data_in[i][k+1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i][k+1] == 1 && data_in[i+1][k] == 0 && data_in[i-1][k] == 0 && data_in[i][k-1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i][k-1] == 1 && data_in[i][k+1] == 1 && data_in[i+1][k] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i+1][k] == 1 && data_in[i][k+1] == 1 && data_in[i-1][k] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else data_in[i][k] = 0;
                        end
                    end
                end
            end
        end
        
        else if(btn4 && !temp)
        begin
            for(int i = 0; i < 8; i++)
            begin
                for(int k = 0; k < 8; k++)
                begin
                    if(cellgroups[i][k] == 3'd4)
                    begin
                        if(i == 0 && k == 0)
                        begin
                            if(data_in[0][7] == 1 && data_in[0][1] == 0 && data_in[7][0] == 0 && data_in[0][1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[0][1] == 1 && data_in[0][1] == 0 && data_in[7][0] == 0 && data_in[0][7] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[0][7] == 1 && data_in[0][1] == 1 && data_in[0][1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[0][1] == 1 && data_in[0][1] == 1 && data_in[7][0] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else data_in[i][k] = 0;
                        end
                        else if(i == 7)
                        begin
                            if(data_in[7][k-1] == 1 && data_in[0][k] == 0 && data_in[6][k] == 0 && data_in[7][k+1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[7][k+1] == 1 && data_in[0][k] == 0 && data_in[6][k] == 0 && data_in[7][k-1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[7][k-1] == 1 && data_in[7][k+1] == 1 && data_in[0][k] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[0][k] == 1 && data_in[7][k+1] == 1 && data_in[6][k] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else data_in[i][k] = 0;
                        end
                        else if(i == 0)
                        begin
                            if(data_in[0][k-1] == 1 && data_in[1][k] == 0 && data_in[7][k] == 0 && data_in[0][k+1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[0][k+1] == 1 && data_in[1][k] == 0 && data_in[7][k] == 0 && data_in[0][k-1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[0][k-1] == 1 && data_in[0][k+1] == 1 && data_in[1][k] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[1][k] == 1 && data_in[0][k+1] == 1 && data_in[7][k] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else data_in[i][k] = 0;
                        end
                        else if(k == 0)
                        begin
                            if(data_in[i][7] == 1 && data_in[i+1][0] == 0 && data_in[i-1][0] == 0 && data_in[i][1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i][1] == 1 && data_in[i+1][0] == 0 && data_in[i-1][0] == 0 && data_in[i][7] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i][7] == 1 && data_in[i][1] == 1 && data_in[i+1][0] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i+1][0] == 1 && data_in[i][1] == 1 && data_in[i-1][k] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else data_in[i][k] = 0;
                        end
                        else
                        begin
                            if(data_in[i][k-1] == 1 && data_in[i+1][k] == 0 && data_in[i-1][k] == 0 && data_in[i][k+1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i][k+1] == 1 && data_in[i+1][k] == 0 && data_in[i-1][k] == 0 && data_in[i][k-1] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i][k-1] == 1 && data_in[i][k+1] == 1 && data_in[i+1][k] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else if(data_in[i+1][k] == 1 && data_in[i][k+1] == 1 && data_in[i-1][k] == 0)
                            begin
                                data_in[i][k] = 1;
                            end
                            else data_in[i][k] = 0;
                        end
                    end
                end
            end
        end
    end
    
    converter myConverter(clk, data_in, rowsOut, shcp, stcp, mr, oe, ds);
endmodule
