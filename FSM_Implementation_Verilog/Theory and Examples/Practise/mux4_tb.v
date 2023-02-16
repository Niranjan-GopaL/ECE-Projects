//Testbench for the mux
module tb_mux;

    // Declaring Inputs
    reg Data_in_0;
    reg Data_in_1, Data_in_2, Data_in_3;
    reg[1:0] sel;

    // Declaring Outputs
    wire Data_out;

    // Instantiate the Unit Under Test (UUT)
    mux4 uut (
        .in0(Data_in_0), 
        .in1(Data_in_1), 
	.in2(Data_in_2), 
        .in3(Data_in_3), 
        .select(sel), 
        .out(Data_out)
    );

    initial begin
	//for creating vcd waveform file to view in gtkwave
	
	$dumpfile ("mux4_out.vcd"); 
	$dumpvars(0, tb_mux);

        // Apply Inputs
        Data_in_0 = 0;
        Data_in_1 = 0;
	Data_in_2 = 0;
	Data_in_3 = 0;
        sel = 2'b00;
        // Wait 100 ns
        #100;
      
    end
      

always @ (Data_in_0,Data_in_1,Data_in_2,Data_in_3,sel)
	begin
  
        //Similarly apply Inputs always
        Data_in_0 = 0;      Data_in_1 = 0;    Data_in_2 = 0;      Data_in_3 = 0;    sel = 2'b00;      #10;
        Data_in_0 = 0;      Data_in_1 = 1;    Data_in_2 = 1;      Data_in_3 = 0;    sel = 2'b01;      #10;
        Data_in_0 = 0;      Data_in_1 = 0;     Data_in_2 = 1;      Data_in_3 = 1;    sel = 2'b10;      #10;
        Data_in_0 = 1;      Data_in_1 = 0;     Data_in_2 = 1;      Data_in_3 = 0;    sel = 2'b11;      #50;
        Data_in_0 = 1;      Data_in_1 = 0;     Data_in_2 = 1;      Data_in_3 = 0;    sel = 2'b10;      #10;
        Data_in_0 = 1;      Data_in_1 = 1;     Data_in_2 = 1;      Data_in_3 = 0;    sel = 2'b00;      #10;
        Data_in_0 = 1;      Data_in_1 = 1;      Data_in_2 = 1;      Data_in_3 = 0;   sel = 2'b10;      #10;

	end

endmodule



//Commands to run the file
//compile using the following command:
// iverilog -o mux_out.out  lab1-mux2.v lab1-mux2_tb.v

//Type in ls :this should show you mux_out.out file

//Run the binary using the following command:
//vvp mux_out.out 

//View the file using the following command:
//gtkwave mux_out.vcd

