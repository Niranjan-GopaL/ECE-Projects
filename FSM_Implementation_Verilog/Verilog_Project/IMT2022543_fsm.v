module FSM( 
input clock, reset, inpt,
output reg outpt,
output reg[1:0] present_state);
parameter A=2'b01, B=2'b10, C=2'b11;
   
always @(clock,reset) 
begin
	if (reset) 
    begin
        present_state <= A;
        outpt <= 0;
    end
    else
    begin
        case (present_state)

        A :begin
            present_state=inpt?C:B;
            outpt <= 0;
        end

        B : begin
            present_state = inpt ? C : B;
            outpt <= inpt;
        end
        C : begin
            present_state = inpt ? C : B;
            outpt <= ~inpt;
        end
        endcase
    end
end
endmodule

`timescale 1ns/1ps
module FSM_tb();

    reg clock, reset, inpt;
    wire outpt; wire [1:0] present_state;
    FSM uut(clock, reset, inpt, outpt, present_state);

    initial 
    begin
        $dumpfile("FSM_tb.vcd");
        $dumpvars(0,FSM_tb);
        clock = 1;
	reset=1;
        inpt = 0;       #4;//at state B
        reset = 1;      #4;//at state A
        reset = 0;      #4;
        inpt = 0;       #4;// at state B
        inpt = 1;       #4;//at state C
        inpt = 1;       #4;//at state C
        inpt = 0;       #4;//at state B

        reset = 1;      #4;//at state A
        inpt = 1;       #4;//at state C
        reset = 0;      #4;
        inpt = 0;       #4;//at state B
        inpt = 0;       #4;//at state B
        inpt = 1;       #4;//at state C
    
    $finish;
    end

    always 
    begin
    #4 clock = ~clock;
    end
endmodule

