`timescale 1ns/1ns
`include "orgate.v"

module orgate_tb;

//inputs
reg A;
reg B;

//output
wire F;

//uut
orgate UUT (A,B,F);

initial begin
    $dumpfile ("orgate.vcd");
    $dumpvars  (0,orgate_tb);
    {A,B} = 2'b00; #10;
    {A,B} = 2'b01; #10;
    {A,B} = 2'b10; #10;
    {A,B} = 2'b11; #10;
    $finish;
end

endmodule