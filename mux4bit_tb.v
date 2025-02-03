`timescale 1ns/1ns
`include "mux4bit.v"

module mux4bit;

//DATA INPUTS
reg [3:0] A;
reg [3:0] B;


//CONTROL INPUTS
reg C;

//OUTPUTS
wire [3:0] Y;

//UNIT UNDER TEST
mux4bit UUT (A, B, C, Y);

//logic simulation
initial begin
    $dumpfile ("mux4bit.vcd");
    $dumpvars (0, mux4bit_tb);
    A = 4'b0101;
    B = 4'b1010;
    #20
    C = 0;
    #20;
    C = 1;
    #20;
    $finish;
end