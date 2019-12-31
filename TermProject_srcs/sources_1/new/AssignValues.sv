`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2019 05:50:48 PM
// Design Name: 
// Module Name: AssignValues
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


module AssignValues(input clk, digit0, digit1, digit2, digit3, bits0, bits1,
                    input load, button1, button2, button3, button4,
                    output a, b, c, d, e, f, g, dp, [3:0] an,
                    output [15:0] ledregister,
                    output [7:0] rowsOut,
                    output shcp, stcp, mr, oe, ds);
                    
    logic [4:0] value0, value1, value2, value3;
    logic gameover;
    logic delayedload;
    logic btn1, btn2, btn3, btn4, reset, restart;
    logic [2:0] done; 
    logic [63:0] register;
    integer cellgroups[7:0][7:0];
    
    ResetButton myReset(clk, load, done, reset);
    RestartButton myRestart(clk, load, done, restart);
    LoadHelper helper1(clk, button1, done, btn1);
    LoadHelper helper2(clk, button2, done, btn2);
    LoadHelper helper3(clk, button3, done, btn3);
    LoadHelper helper4(clk, button4, done, btn4);
    CellGroupMatrix myCellMatrix(cellgroups);
    LoadHelper helper(clk, load, done, delayedload);
    ValueHelper myHelper(clk, reset, restart, digit0, digit1, digit2, digit3, delayedload, btn1, btn2, btn3, btn4, gameover, done, value0, value1, value2, value3); 
    SevenSegmentDisplay mySeg(clk, value0, value1, value2, value3, a, b, c, d, e, f, g, dp, an);
    Register myRegister(clk, reset, value0, value1, value2, value3, bits0, bits1, done, ledregister, register);
    DotMatrix myMatrix(clk, reset, btn1, btn2, btn3, btn4, done, register, cellgroups, rowsOut, gameover, shcp, stcp, mr, oe, ds);
   
endmodule
