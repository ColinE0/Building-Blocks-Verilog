`timescale 1ns/1ns
`include "and_gate.v"

module andgate_tb;

//input
reg A;
reg B;

//output
wire F;

//unit under test

andgate UUT (A,B,F);

initial begin
    $dumpfile ("andgate.vcd");
    $dumpvars (0,andgate_tb);
    {A,B} = 2'b00; #10;
    {A,B} = 2'b01; #10;
    {A,B} = 2'b10; #10;
    {A,B} = 2'b11; #10;
    $finish;
end

endmodule