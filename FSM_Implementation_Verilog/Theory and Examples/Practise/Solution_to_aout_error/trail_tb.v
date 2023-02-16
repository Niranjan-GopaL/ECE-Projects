`timescale 1ns/1ns
`include "trail.v"

module trail_tb;

reg A;
wire B;

trail uut(A, B);

initial begin

    $dumpfile("trail_tb.vcd");
    $dumpvars(0, trail_tb);

    A = 0;
    #20;

    A = 1;
    #20;

    A = 0;
    #20;

    $display("test complete");
end

endmodule