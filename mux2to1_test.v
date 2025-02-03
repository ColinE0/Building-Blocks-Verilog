`timescale 1ns/1ns 
`include "mux2to1_8bit.v"

module mux2to1_tb;

reg [7:0] A; 
reg [7:0] B;
reg C;

wire [7:0] Y;

mux2to1_8bit UUT (A, B, C, Y);

initial begin
    $dumpfile("mux2to1_8bit.vcd");
    $dumpvars(0, mux2to1_tb);

    {A, B, C} = 8'd0; #10; $display ("%b | %b | %b | %b", A, B, C, Y);
    {A, B, C} = 8'd1; #10; $display ("%b | %b | %b | %b", A, B, C, Y);
    {A, B, C} = 8'd2; #10; $display ("%b | %b | %b | %b", A, B, C, Y);
    {A, B, C} = 8'd3; #10; $display ("%b | %b | %b | %b", A, B, C, Y);
    {A, B, C} = 8'd4; #10; $display ("%b | %b | %b | %b", A, B, C, Y);
    {A, B, C} = 8'd5; #10; $display ("%b | %b | %b | %b", A, B, C, Y);
    {A, B, C} = 8'd6; #10; $display ("%b | %b | %b | %b", A, B, C, Y);
    {A, B, C} = 8'd7; #10; $display ("%b | %b | %b | %b", A, B, C, Y);
    
/*
   A=0;B=0;C=0; #10; $display(A, " | ", B, " | ", C, " | ", Y);
   A=0;B=0;C=1; #10; $display(A, " | ", B, " | ", C, " | ", Y);
   A=0;B=1;C=0; #10; $display(A, " | ", B, " | ", C, " | ", Y);
   A=0;B=1;C=1; #10; $display(A, " | ", B, " | ", C, " | ", Y);
   A=1;B=0;C=0; #10; $display(A, " | ", B, " | ", C, " | ", Y);
   A=1;B=0;C=1; #10; $display(A, " | ", B, " | ", C, " | ", Y);
   A=1;B=1;C=0; #10; $display(A, " | ", B, " | ", C, " | ", Y);
   A=1;B=1;C=1; #10; $display(A, " | ", B, " | ", C, " | ", Y);
*/
end

endmodule