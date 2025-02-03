`include "alu_accum.v"
`timescale 10ns/1ns
 
module alu_accum_test;

    //Inputs
    reg CLR;
    reg [7:0] count = 0;
    reg [7:0] D;
    reg [7:0] B;
    reg E, S;

    //Wire
    wire [7:0] Q;

    //Register
    reg CLK = 1'b0;
    always
    begin
    CLK <= ~CLK;
    #5;
    end


    top UUT(CLK, CLR, Q, B, E, S);

    initial begin
        $display("Start of test:");
        $dumpfile("alu_accum.vcd");
        $dumpvars(0, alu_accum_test);
        E = 1;
        S = 0;
        CLR = 0;

        B = 0;  #10;
        B = 3;  #10;
        B = 7;  #10;
        B = 10; #50;
        S = 1;

        while(Q >= 12) begin
            B = 12;
            count = count + 1; #10;
        end

        $display("(((3+7)*6)/12) = " , count);
        $finish;
        $display("Test terminated.");
    end
endmodule