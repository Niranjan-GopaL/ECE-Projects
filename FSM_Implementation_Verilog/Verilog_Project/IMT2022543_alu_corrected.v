module alu(
           input [7:0] A,B,                  
           input [3:0] ALU_Sel,
           output reg [7:0] ALU_Out, 
           output  CarryOut // Carry Out Flag
    );
    wire [8:0] tmp;
    assign tmp = {1'b0,A} + {1'b0,B};
    assign CarryOut = tmp[8]; // Carryout flag

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
        endcase
    end 
endmodule

`timescale 1ns / 1ps  
module tb_alu;
 reg[7:0] A,Carryout;
 reg[3:0] ALU_Sel;
 reg[7:0] B;

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
        $dumpfile("alu.vcd");
        $dumpvars(0, tb_alu);
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


// After adding begin and end to always block,
//changing name of the module in module in dumpvars()
//Remaining errors :-

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


// After watching few tutorials on verilog:
//Removed ALU_Result cuz it appeared to be redundant,  rewrote the code

/*
alu_with_errors.v:12: syntax error
alu_with_errors.v:12: error: Invalid module instantiation
alu_with_errors.v:16: error: invalid module item.
alu_with_errors.v:17: syntax error
alu_with_errors.v:18: error: invalid module item.
alu_with_errors.v:19: syntax error
alu_with_errors.v:20: error: invalid module item.
alu_with_errors.v:21: syntax error
alu_with_errors.v:22: error: invalid module item.
alu_with_errors.v:23: syntax error
alu_with_errors.v:24: error: invalid module item.
alu_with_errors.v:25: syntax error
alu_with_errors.v:26: error: invalid module item.
alu_with_errors.v:27: syntax error
alu_with_errors.v:28: error: invalid module item.
alu_with_errors.v:29: syntax error
alu_with_errors.v:30: error: invalid module item.
alu_with_errors.v:31: syntax error
alu_with_errors.v:32: error: invalid module item.
alu_with_errors.v:33: syntax error
alu_with_errors.v:34: error: invalid module item.
alu_with_errors.v:35: syntax error
alu_with_errors.v:36: error: invalid module item.
alu_with_errors.v:37: syntax error
alu_with_errors.v:38: error: invalid module item.
alu_with_errors.v:39: syntax error
alu_with_errors.v:40: error: invalid module item.
alu_with_errors.v:41: syntax error
alu_with_errors.v:42: error: invalid module item.
alu_with_errors.v:43: syntax error
alu_with_errors.v:44: error: invalid module item.
alu_with_errors.v:45: syntax error
alu_with_errors.v:46: error: invalid module item.
alu_with_errors.v:47: syntax error
alu_with_errors.v:47: error: invalid module item.
alu_with_errors.v:48: syntax error
alu_with_errors.v:52: error: invalid module item.
alu_with_errors.v:57: error: 'ALU_Out' has already been declared in this scope.
alu_with_errors.v:4:      : It was declared here as a variable.
alu_with_errors.v:58: error: 'CarryOut' has already been declared in this scope.
alu_with_errors.v:5:      : It was declared here as a variable.
*/

//After bunch of trial and learning verilog , this is the final file