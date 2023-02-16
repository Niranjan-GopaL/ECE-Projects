//Testbench for the mux
module tb_mux;

    // Declaring Inputs
    reg Data_in_0;
    reg Data_in_1;
    reg sel;

    // Declaring Outputs
    wire Data_out;

    // Instantiate the Unit Under Test (UUT)
    mux2to1 uut (
        .Data_in_0(Data_in_0), 
        .Data_in_1(Data_in_1), 
        .sel(sel), 
        .Data_out(Data_out)
    );

    initial begin
	//for creating vcd waveform file to view in gtkwave
	
	$dumpfile ("mux_out.vcd"); 
	$dumpvars(0, tb_mux);

        // Apply Inputs
        Data_in_0 = 0;
        Data_in_1 = 0;
        sel = 0;
        // Wait 100 ns
        #100;
        
        //Similarly apply Inputs and wait for 100 ns
        Data_in_0 = 0;      Data_in_1 = 0;      sel = 1;      #10;
        Data_in_0 = 0;      Data_in_1 = 1;      sel = 0;      #10;
        Data_in_0 = 0;      Data_in_1 = 1;      sel = 1;      #10;
        Data_in_0 = 1;      Data_in_1 = 0;      sel = 0;      #50;
        Data_in_0 = 1;      Data_in_1 = 0;      sel = 1;      #10;
        Data_in_0 = 1;      Data_in_1 = 1;      sel = 0;      #10;
        Data_in_0 = 1;      Data_in_1 = 1;      sel = 1;      #10;
    end
      
endmodule



//Commands to run the file
//compile using the following command:
// iverilog -o mux_out.out  lab1-mux2.v lab1-mux2_tb.v

//Type in ls :this should show you mux_out.out file

//Run the binary using the following command:
//vvp mux_out.out  or ./mux_out.out

//View the file using the following command:
//gtkwave mux_out.vcd

