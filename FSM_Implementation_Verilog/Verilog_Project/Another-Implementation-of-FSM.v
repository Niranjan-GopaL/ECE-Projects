module FSM(clk, reset, in, out, present_state);
	input clk, reset, in;
	output reg out;
	output reg[1:0] present_state;
	localparam A=2'b00, B=2'b01, C=2'b10;
	
		
	always @ (negedge reset, posedge clk)
		if (reset) begin
		present_state <= A;
		out <= 0;
		end
		else       
		case (present_state)
			A :  if (in) begin
				present_state <= C;
				out <= 0;
				end
			    else begin
			     	present_state <= B;
			     	out <= 0;
			     	end
			B :  if (in) begin
				present_state <= C;
				out <= 1;
				end
			     else begin
			     	present_state <= B;
			     	out <= 0;
			     	end
			C :  if (in) begin 
				present_state <= C;
				out <= 0;
				end
			     else begin
			     	present_state <= B;
			     	out <= 1;
			     	end


    //As there are only three states one must be don't care term
		endcase
endmodule

`timescale 1ns/1ps
module testbench();
reg clk,reset,in;
wire out;

wire [1:0] present_state;

FSM dut(clk, reset, in, out, present_state);

initial begin
	$dumpfile("testbench.vcd");
	$dumpvars(0,testbench);
    clk = 1;
    reset = 1;
    in = 0;
    #5 reset = 0;
    #4 in = 1;
    #4 in = 0;
    #4 in = 1;
    #5 in = 0;
    reset = 1;
    #5 in = 1;
    reset = 0;
    #4 in = 0;
    #4 in = 1;
    #4 in = 0;
    #5
    
    $finish;
  end

  always #2 clk = ~clk;
endmodule


		
