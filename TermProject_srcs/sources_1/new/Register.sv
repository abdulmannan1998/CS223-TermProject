`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2019 07:45:25 PM
// Design Name: 
// Module Name: Register
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


module Register(input clk, reset,
                input [4:0] value0, value1, value2, value3,
                input bits0, bits1, [2:0] done,
                output [15:0] ledregister,
                output [63:0] tempregister);

    logic [63:0] register;
    logic [1:0] next16bits = 2'b00;
    logic [15:0] templedregister;
    
    assign tempregister = register;
    assign ledregister = templedregister;
    
    always_ff@(posedge clk)
    begin
        if(reset)
        begin
            next16bits = 2'b00;
            register = 0;
        end
        case(next16bits)
        2'b00:
        begin
            if(done == 3'd1)
            begin
                register[63:60] = value3;
                register[59:56] = value2;
                register[55:52] = value1;
                register[51:48] = value0;
                next16bits = 2'b01;
            end
        end
        
        2'b01:
        begin
            if(done == 3'd2)
            begin
                register[47:44] = value3;
                register[43:40] = value2;
                register[39:36] = value1;
                register[35:32] = value0;
                next16bits = 2'b10;
            end
        end
        
        2'b10:
        begin
            if(done == 3'd3)
            begin
                register[31:28] = value3;
                register[27:24] = value2;
                register[23:20] = value1;
                register[19:16] = value0;
                next16bits = 2'b11;
            end
        end
        
        2'b11:
        begin
            if(done == 3'd4)
            begin
                register[15:12] = value3;
                register[11:8] = value2;
                register[7:4] = value1;
                register[3:0] = value0;
                next16bits = 2'b00;
            end
        end
        endcase
        
        if(done == 3'd5)
        begin
//            register = 64'd0;
//            next16bits = 2'b00;
        end
    end   
    
    always_ff@(posedge clk)
    begin
        case({bits1, bits0})
        2'b00:
        begin
            templedregister <= register[63:48];
        end
        
        2'b01:
        begin
            templedregister <= register[47:32];
        end
        
        2'b10:
        begin
            templedregister <= register[31:16];
        end
        
        2'b11:
        begin
            templedregister <= register[15:0];
        end
        endcase
    end
endmodule
