`timescale 1ns/1ps;
`include "mux_4_1.v"

module mux_4_1_tb;

reg Data_i0,Data_i1,Data_i2,Data_i3;
reg Data_s0,Data_s1;

wire Data_out;

mux_4_1 mux(Data_i0,Data_i1,Data_i2,Data_i3,Data_s0,Data_s1,Data_out);

initial
begin
    $dumpfile("mux_4_1_out.vcd");
    $dumpvars(0,mux_4_1_tb);

    Data_i0 = 0;  Data_i1 = 0;  Data_i2 = 0; Data_i3 = 0; ;Data_s0 = 0; Data_s1 = 0;  #50;
    Data_i0 = 0;  Data_i1 = 0;  Data_i2 = 1; Data_i3 = 1; ;Data_s0 = 1; Data_s1 = 1;  #10;
    Data_i0 = 0;  Data_i1 = 1;  Data_i2 = 0; Data_i3 = 0; ;Data_s0 = 0; Data_s1 = 0;  #10;
    Data_i0 = 0;  Data_i1 = 1;  Data_i2 = 1; Data_i3 = 1; ;Data_s0 = 1; Data_s1 = 1;  #10;
    Data_i0 = 1;  Data_i1 = 0;  Data_i2 = 0; Data_i3 = 0; ;Data_s0 = 0; Data_s1 = 0;  #10;
    Data_i0 = 1;  Data_i1 = 0;  Data_i2 = 1; Data_i3 = 1; ;Data_s0 = 1; Data_s1 = 1;  #10;
    Data_i0 = 1;  Data_i1 = 1;  Data_i2 = 0; Data_i3 = 0; ;Data_s0 = 0; Data_s1 = 0;  #10;
    Data_i0 = 1;  Data_i1 = 1;  Data_i2 = 1; Data_i3 = 1; ;Data_s0 = 1; Data_s1 = 1;  #10;
end
    
endmodule
