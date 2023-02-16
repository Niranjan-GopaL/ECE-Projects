module mux2to1( Data_in_0, Data_in_1, sel, Data_out );

    //what are the input ports.
    input Data_in_0;
    input Data_in_1;
    input sel;
    //What are the output ports.
    output Data_out;
    //Internal variables - usually the output.
    reg Data_out;

    //Always block - the statements inside this block are executed when the given sensitivity list 
    //is satisfied. for example in this case the block is executed when any changes occur in the three
    // signals 'Data_in_0','Data_in_1' or 'sel'.
    always @(Data_in_0,Data_in_1,sel)
    begin
        if(sel == 0) 
            Data_out = Data_in_0;  //when select signal to the mux is low
        else
            Data_out = Data_in_1;  //when select signal to the mux is high
    end
    
endmodule


