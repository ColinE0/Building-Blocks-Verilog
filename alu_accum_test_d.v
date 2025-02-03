`include "alu_accum.v"
`timescale 1ps/1ps

module alu_accum_test;
//REGISTERS
    reg [7:0] A;
    reg S;
    wire [7:0] W;

    alu_accum UUT (.A(A), .CLK(CLK), .S(S), .W(W));

    //CLOCK 
    reg CLK = 1'b1;
    always  
    begin
        CLK = ~CLK;
        #5;
    end

initial begin
    $dumpfile("alu_accum.vcd");
    $dumpvars(0, alu_accum_test);
    $display("Start of Test");
    A = 8'b00000111; S=1; #10; 
    A = 8'b00000011; S=0; #10; 
    A = 8'b00000001; S=0; #10; 
    A = 8'b00000001; S=0; #10; 

    $display(W);
    $finish;
end

endmodule