/*Important: Once you run ./a.out, it will keep running infinitely, because it is in an always block. You need to hit Ctrl +Z to stop it, else, the vcd will become a large file and will never end.

*/

`timescale 1ns/1ps
module dflipflop(q, d, clk);
output q;
input d;
input clk;
reg q;

//behavioral/ sequential designs
always @(posedge clk) // trigger/sensitivity list
q = d;  // <= is a non-blocking statement
endmodule

//Testbench:
module dflipfloptb;
reg d;
reg clk;
wire q;

dflipflop name (q,d,clk);

initial begin
// Initialize Inputs
$dumpfile ("dff_out.vcd"); 
$dumpvars(0,dflipfloptb);

//These initial statements are very important- without which the next always block
//will not work
d = 0;  //at time=0
clk = 0; //at time=0
end

always 
#3 clk = ~clk; // toggle or negate the clock every 3 units of time.
// ~ is a negation operator

always 
#5 d=~d;  // toggle or negate the D input every 5 units of time
//Alternately:
//always begin
//#5 d =1;
//#15 d=0;
//#2 d=1;
//end
endmodule

