`timescale 1ns/1ps

//Testbench for the mux
module tb_mux;

    // Declaring Inputs
    reg Data_in_0; //we are assigning a value to these inputs. so, they are reg
    reg Data_in_1;
    reg sel;

    // Declaring Outputs
    wire Data_out; //wire is playing the role of not getting assigned any value


 // module mux2 (in0, in1, select, out);

    // Instantiate the design mux2
    mux2 namexyz (Data_in_0, Data_in_1, sel, Data_out);
 

//anything which does not hold a value --> which just passes a value is a wire

//Data_out = 1 --> output is output of the logic circuit

//wire: we do not assign any value to the output
//Data_in_0, Data_in_1, sel: Inputs to the mux module

//Data_in_0 = 1 --> assign some values --> store the value --> reg

//behavioral design
    initial 
    begin
	//for creating vcd waveform file to view in gtkwave
	
	$dumpfile ("mux_out.vcd"); //by default vcd
	$dumpvars(0, tb_mux); //top module

        // Apply Inputs--> Assignment to this signal --> it is holding this value
// has to be reg 
        Data_in_0 = 0;
        Data_in_1 = 0;
        sel = 0;
        // Wait 50 ns
        #50; // --> 50 * 1ns --> 50ns
        
        //Similarly apply Inputs and wait for 10 ns
        Data_in_0 = 0;      Data_in_1 = 0;      sel = 1;      #10; // --> 50 + 10 = 60
        Data_in_0 = 0;      Data_in_1 = 1;      sel = 0;      #10;
        Data_in_0 = 0;      Data_in_1 = 1;      sel = 1;      #10;
        Data_in_0 = 1;      Data_in_1 = 0;      sel = 0;      #50;
        Data_in_0 = 1;      Data_in_1 = 0;      sel = 1;      #10;
        Data_in_0 = 1;      Data_in_1 = 1;      sel = 0;      #10;
        Data_in_0 = 1;      Data_in_1 = 1;      sel = 1;      #10;
    end
      
endmodule //end module for the testbench



//Commands to run the file
//compile using the following command:
// iverilog -o mux_out.out  mux2_testbench.v structural_mux2.v 


//Type in ls :this should show you mux_out.out file

//Run the binary using the following command:
//vvp mux_out.out  Or using  ./mux_out.out

//Alternately you can just use the following command to run iverilog
// iverilog   mux2_testbench.v structural_mux2.v  --> in this case, a.out is created
// Run this using the command ./a.out

//View the file using the following command:
//gtkwave mux_out.vcd

