//Assume the full adder shown below.
//Write a test bench to test it

module Full_Adder( 
  input D1, D2, Cin, 
  output Sum_out, Cout
  );  
    wire a1, a2, a3;    

xor u1(a1,D1,D2);
and u2(a2,D1,D2);
and u3(a3,a1,Cin);
or u4(Cout,a2,a3);
xor u5(Sum_out,a1,Cin); 

endmodule  
