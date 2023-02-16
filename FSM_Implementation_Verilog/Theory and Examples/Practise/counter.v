/*Important: Once you run ./a.out, it will keep running infinitely, because it is in an always block. You need to hit Ctrl +Z to stop it, else, the vcd will become a large file and will never end.

*/

`timescale 1ns/1ps

module up_counter    (
out     ,  // Output of the counter
enable  ,  // enable for counter
clk     ,  // clock Input
reset      // reset Input
);

output [3:0] out;
//you can alternately write this as output reg [3:0] out;
input enable, clk, reset;
//------------Internal Variables--------
reg [3:0] out; 



always @(posedge clk)
if (reset) begin //reset ==1
  out = 4'b0 ;
end 
else if (enable) begin //reset =0
  out = out + 1;
end

endmodule 


module upcounter_testbench();
reg clk, reset, enable;
wire [3:0] out;

//create an instance of the design
up_counter dut(out, enable, clk, reset);

initial begin

//note that these statements are sequential.. execute one after the other 

$dumpfile ("count.vcd"); 
$dumpvars(0,upcounter_testbench);

clk=0;  //at time=0
enable=0;  //at time=0
reset=1;//at time=0

#20; //delay 20 units
reset=0; //after 20 units of time, reset becomes 0
enable=1; //at the same time, at time=20, enable is made 1

//Try this statement instead:
//#10 enable=1; //enable is made 1 at 30 units of time. Note the difference in the waveform

end


always 
#5 clk=~clk;  // toggle or negate the clk input every 5 units of time


endmodule 
