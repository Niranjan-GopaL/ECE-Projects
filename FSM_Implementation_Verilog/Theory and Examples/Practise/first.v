// module name can't begin with a number , 2_1_mux is invalid module name
module structure_mux(in0,in1,select_line,out);

input in0 , in1 , select_line;
output out;
wire not_select_line,o1,o2;

not not1(not_select_line,select_line);
and and1(o1,in0,not_select_line);
and and2(o2,in1,select_line);
or final_or(out,o1,o2);
    
endmodule