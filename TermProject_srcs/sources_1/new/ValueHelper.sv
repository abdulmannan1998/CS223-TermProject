`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2019 01:50:17 AM
// Design Name: 
// Module Name: ValueHelper
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


module ValueHelper(input clk, reset, restart, digit0, digit1, digit2, digit3, load, btn1, btn2, btn3, btn4, gameover,
                   output [2:0] done,
                   output [4:0] value0, value1, value2, value3);
                   
    logic [4:0] tempvalue0, tempvalue1, tempvalue2, tempvalue3;
    logic [4:0] value00, value11, value22, value33;
    logic [26:0] count, count1;
    logic [2:0] assignvalue = 3'b000;
    logic [2:0] temp = 3'b000;
    integer scorecount;
    
    assign value0 = tempvalue0;
    assign value1 = tempvalue1;
    assign value2 = tempvalue2;
    assign value3 = tempvalue3;
    assign done = temp;
    
    
    always_ff@(posedge clk)
    begin
        case(assignvalue)
            3'b000:
            begin
//                if(temp >= 3'd4) temp = 5;
                if(temp != 3'd5)
                begin
                    value33[0] <= digit0;
                    value33[1] <= digit1;
                    value33[2] <= digit2;
                    value33[3] <= digit3;
                    value33[4] <= 0;
                    if(count < 27'd50000000)
                    begin
                        tempvalue3 <= value33;
                        count <= count + 1;
                    end
                    else if(count1 < 27'd50000000)
                    begin
                        tempvalue3 <= 5'd16;
                        count1 <= count1 + 1;
                    end
                    else begin
                        count <= 0;
                        count1 <= 0;
                    end
                    if(load)
                    begin
                        tempvalue3 <= value33;
                        assignvalue = 3'b001;
                    end
                end
            end
            
            3'b001:
            begin
                value22[0] <= digit0;
                value22[1] <= digit1;
                value22[2] <= digit2;
                value22[3] <= digit3;
                value22[4] <= 0;
                if(count < 27'd50000000)
                begin
                    tempvalue2 <= value22;
                    count <= count + 1;
                end
                else if(count1 < 27'd50000000)
                begin
                    tempvalue2 <= 5'd16;
                    count1 <= count1 + 1;
                end
                else begin
                    count <= 0;
                    count1 <= 0;
                end
                if(load)
                begin
                    tempvalue2 <= value22;
                    assignvalue = 3'b010;
                end
            end
            
            3'b010:
            begin
                value11[0] <= digit0;
                value11[1] <= digit1;
                value11[2] <= digit2;
                value11[3] <= digit3;
                value11[4] <= 0;
                if(count < 27'd50000000)
                begin
                    tempvalue1 <= value11;
                    count <= count + 1;
                end
                else if(count1 < 27'd50000000)
                begin
                    tempvalue1 <= 5'd16;
                    count1 <= count1 + 1;
                end
                else begin
                    count <= 0;
                    count1 <= 0;
                end
                if(load)
                begin
                    tempvalue1 <= value11;
                    assignvalue = 3'b011;
                end
            end
            
            3'b011:
            begin
                value00[0] <= digit0;
                value00[1] <= digit1;
                value00[2] <= digit2;
                value00[3] <= digit3;
                value00[4] <= 0;
                if(count < 27'd50000000)
                begin
                    tempvalue0 <= value00;
                    count <= count + 1;
                end
                else if(count1 < 27'd50000000)
                begin
                    tempvalue0 <= 5'd16;
                    count1 <= count1 + 1;
                end
                else begin
                    count <= 0;
                    count1 <= 0;
                end
                if(load)
                begin
                    tempvalue0 <= value00;
                    assignvalue <= 3'b100;
                    temp <= temp + 1;
                end
            end
            
            3'b100:
            begin
                if(reset)
                begin
                    scorecount <= 0;
                    temp <= 0;
                    tempvalue3 <= 5'd0;
                    tempvalue2 <= 5'd0;
                    tempvalue1 <= 5'd0;
                    tempvalue0 <= 5'd0;
                end
                else if(restart)
                begin
                    scorecount <= 0;
                    temp <= 4;
                    tempvalue3 <= 5'd0;
                    tempvalue2 <= 5'd0;
                    tempvalue1 <= 5'd0;
                    tempvalue0 <= 5'd0;
                end
                else if(load && temp != 3'd4 && temp != 3'd5)
                begin
                    assignvalue <= 3'b000;
                    scorecount <= 0;
                end
                else if((temp == 3'd4 || temp == 3'd5) && !gameover)
                begin
                    if((btn1 || btn2 || btn3 || btn4) && !gameover) begin
                         scorecount <= scorecount + 1;
                         temp = 3'd5;
                    end
                    tempvalue0 <= scorecount % 10;
                    tempvalue1 <= (scorecount/10) % 10;
                    tempvalue2 <= (scorecount/100) % 10;
                    tempvalue3 <= (scorecount/1000) % 10;
                end
                else if(gameover)
                begin
                    if(count < 27'd25000000)
                    begin
                        tempvalue0 <= scorecount % 10;
                        tempvalue1 <= (scorecount/10) % 10;
                        tempvalue2 <= (scorecount/100) % 10;
                        tempvalue3 <= (scorecount/1000) % 10;
                        count <= count + 1;
                    end
                    else if(count1 < 27'd25000000)
                    begin
                        tempvalue3 <= 5'd16;
                        tempvalue2 <= 5'd16;
                        tempvalue1 <= 5'd16;
                        tempvalue0 <= 5'd16;
                        count1 <= count1 + 1;
                    end
                    else begin
                       count <= 0;
                       count1 <= 0;
                    end
                end
            end
        endcase   
    end
endmodule
