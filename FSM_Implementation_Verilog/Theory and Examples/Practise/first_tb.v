//So the time unit is 1ns and whenever we encounter #10 it is 10*1ns = 1ns delay
`timescale 1ns/1ps
// Since I was getting `bash: ./a.out: /c/Source/iverilog-install/bin/vvp^M: bad interpreter: No such file or directory` 
// error shown whenver I try to execute ./a.out ,I had to get the .vcd file synthesised in some other way
// As I understand I had to use these vvp commands
`include "first.v"


// use - instead of _ , it's easier to ctrl move and del and stuff
module first_tb;

reg Data_for_in0;
reg Data_for_in1;
reg Data_for_select_line;

wire Data_for_out;;

// Creating an instance of the module 
structure_mux mux_component(Data_for_in0,Data_for_in1,Data_for_select_line,Data_for_out);

initial begin

    //
    $dumpfile("first_out.vcd");
    // starting from t=0 the module first_tb is dumped
    $dumpvars(0,first_tb);


    Data_for_in0 = 0;  Data_for_in1 = 0;  Data_for_select_line = 0;  #50;
    Data_for_in0 = 0;  Data_for_in1 = 0;  Data_for_select_line = 1;  #10;
    Data_for_in0 = 0;  Data_for_in1 = 1;  Data_for_select_line = 0;  #10;
    Data_for_in0 = 0;  Data_for_in1 = 1;  Data_for_select_line = 1;  #10;
    Data_for_in0 = 1;  Data_for_in1 = 0;  Data_for_select_line = 0;  #10;
    Data_for_in0 = 1;  Data_for_in1 = 0;  Data_for_select_line = 1;  #10;
    Data_for_in0 = 1;  Data_for_in1 = 1;  Data_for_select_line = 0;  #10;
    Data_for_in0 = 1;  Data_for_in1 = 1;  Data_for_select_line = 1;  #10;
end
    
endmodule