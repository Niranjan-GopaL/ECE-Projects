`include "../mux_2_1/first.v"

module mux_4_1 (
    i0,
    i1,
    i2,
    i3,
    s0,
    s1,
    out
);
input  i0,i1,i2,i3,s0,s1;
output out;
wire o1,o2;

structure_mux m1(i0,i1,s0,o1);
structure_mux m2(i2,i3,s0,o2);
structure_mux m3(o1,o2,s1,out);
    
endmodule