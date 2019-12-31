`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2019 02:02:16 AM
// Design Name: 
// Module Name: CellGroupMatrix
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


module CellGroupMatrix(output integer cellGroupMatrix[7:0][7:0]);

    integer temp[7:0][7:0];
    
    assign cellGroupMatrix = temp;
    
    always_comb
    begin
        temp[7][7] = 1;
        temp[7][6] = 2;
        temp[7][5] = 1;
        temp[7][4] = 2;
        temp[7][3] = 4;
        temp[7][2] = 3;
        temp[7][1] = 4;
        temp[7][0] = 3;
        temp[6][7] = 3;
        temp[6][6] = 4;
        temp[6][5] = 3;
        temp[6][4] = 4;
        temp[6][3] = 1;
        temp[6][2] = 2;
        temp[6][1] = 1;
        temp[6][0] = 2;
        temp[5][7] = 1;
        temp[5][6] = 2;
        temp[5][5] = 1;
        temp[5][4] = 2;
        temp[5][3] = 4;
        temp[5][2] = 3;
        temp[5][1] = 4;
        temp[5][0] = 3;
        temp[4][7] = 3;
        temp[4][6] = 4;
        temp[4][5] = 3;
        temp[4][4] = 4;
        temp[4][3] = 1;
        temp[4][2] = 2;
        temp[4][1] = 1;
        temp[4][0] = 2;
        temp[3][7] = 2;
        temp[3][6] = 3;
        temp[3][5] = 2;
        temp[3][4] = 3;
        temp[3][3] = 2;
        temp[3][2] = 3;
        temp[3][1] = 2;
        temp[3][0] = 3;
        temp[2][7] = 1;
        temp[2][6] = 4;
        temp[2][5] = 1;
        temp[2][4] = 4;
        temp[2][3] = 1;
        temp[2][2] = 4;
        temp[2][1] = 1;
        temp[2][0] = 4;
        temp[1][7] = 2;
        temp[1][6] = 3;
        temp[1][5] = 2;
        temp[1][4] = 3;
        temp[1][3] = 2;
        temp[1][2] = 3;
        temp[1][1] = 2;
        temp[1][0] = 3;
        temp[0][7] = 1;
        temp[0][6] = 4;
        temp[0][5] = 1;
        temp[0][4] = 4;
        temp[0][3] = 1;
        temp[0][2] = 4;
        temp[0][1] = 1;
        temp[0][0] = 4;
    end
endmodule
