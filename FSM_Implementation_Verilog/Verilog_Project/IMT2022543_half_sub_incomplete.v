// add inputs, outputs
// add logic for gates in the assign statements 

module xor_gate(a,b,out);
input a,b;
output out;

assign out = ~a&b | a&~b;
endmodule


module and_gate(a,b,out);
input a,b;
output out;

assign out = a & b;
endmodule


module not_gate(a,out);
input a;
output out;

assign out = ~a;
endmodule


module half_subtractor(a, b, difference, borrow);
input a,b;
output difference, borrow;
wire x;

not_gate not_gate_in_half_sub(a,x);
xor_gate xor_gate_in_half_sub(a,b,difference);
and_gate and_gate_in_half_sub(x,b,borrow);
endmodule


//Testbench for half subtractor has been given
`timescale 1ns/1ps
module top;
 reg  A, B;
 wire Difference, Borrow; 
  half_subtractor instantiation(A, B, Difference, Borrow);
  initial
    begin
      $dumpfile("xyz.vcd");
      $dumpvars(0, top);
      A=0;
      B=0;
      #100 $finish;
    end

always #10 A=~A;
always #5 B=~B;
endmodule


// Error 1:
/*

half_sub_incomplete.v:27: error: reg out; cannot be driven by primitives or continuous assignment.
half_sub_incomplete.v:18: error: reg out; cannot be driven by primitives or continuous assignment.
half_sub_incomplete.v:9: error: reg out; cannot be driven by primitives or continuous assignment.
3 error(s) during elaboration.

Initially i did this in all the modules:
reg out;
assign out = a & b;

What I thought I was doing was (Becuase I thought since we are changing value of out
It should be able to hold value):
reg out;
out = a & b;

*/

// Customisation 

/*
THe gtkwave shoed waveforms in tho order:
A
B
Borrow
Difference

I wanted it show in this order:
A
B
Difference
Borrow

So i needed to know what does that depend on (the order in which we declare ports?
or the order in which they are output-ed)
Turned out it was the latter.
*/