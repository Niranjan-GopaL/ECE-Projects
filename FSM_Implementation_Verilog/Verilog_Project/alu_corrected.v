module alu(
           input [7:0] A,B,                  
           input [3:0] ALU_Sel,
           output reg [7:0] ALU_Out, 
           output reg CarryOut // Carry Out Flag
    );
    reg [8:0] tmp;
    tmp = {1'b0,A} + {1'b0,B};
    CarryOut = tmp[8]; // Carryout flag
    always @(*) 
    begin  
        case(ALU_Sel)
        4'b0000: 
           ALU_Out = A + B; 
        4'b0001: 
           ALU_Out = A - B;
        4'b0010:
           ALU_Out = A * B;
        4'b0011: 
           ALU_Out = A/B;
        4'b0100: 
           ALU_Out = A<<1;
         4'b0101:
           ALU_Out = A>>1;
         4'b0110: 
           ALU_Out = {A[6:0],A[7]};
         4'b0111:
           ALU_Out = {A[0],A[7:1]};
          4'b1000:
           ALU_Out = A & B;
          4'b1001: 
           ALU_Out = A | B;
          4'b1010: 
           ALU_Out = A ^ B;
          4'b1011:
           ALU_Out = ~(A | B);
          4'b1100:
           ALU_Out = ~(A & B);
          4'b1101: 
           ALU_Out = ~(A ^ B);
          4'b1110: 
           ALU_Out = (A>B)?8'd1:8'd0;
          4'b1111: 
           ALU_Out = (A==B)?8'd1:8'd0;
          default: ALU_Out = A + B;
    end 
endmodule

`timescale 1ns / 1ps  
module tb_alu;
 reg[7:0] A,Carryout;
 reg[3:0] ALU_Sel;
 reg B;

 wire[7:0] ALU_Out;
 wire CarryOut;
 integer i;
 alu test_uut(
            A,B,                   
            ALU_Sel,
            ALU_Out, 
            CarryOut // Carry Out Flag
     );
    initial begin
        $dumpfile("alua.vcd");
        $dumpvars(0, alu);
        A = 8'h0A;
        B = 8'h02;
        ALU_Sel = 4'h0;
        
        for (i=0;i<=15;i=i+1) 
        begin
        ALU_Sel = ALU_Sel + 4'b01;
        #10;   
        end;
        
        A = 8'hF6;
        B = 8'h0A;
    end
endmodule

//Initially the errors are-

// they can be viewed as 4 parts:

/*
alu_with_errors.v:47: syntax error

alu_with_errors.v:52: error: malformed statement
alu_with_errors.v:52: error: Incomprehensible case expression.

alu_with_errors.v:53: syntax error
alu_with_errors.v:55: error: malformed statement
alu_with_errors.v:55: error: Incomprehensible case expression.

alu_with_errors.v:56: syntax error
I give up.
*/