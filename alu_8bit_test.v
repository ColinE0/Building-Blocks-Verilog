`include "alu_8bit.v"
`timescale 1ns/1ns

module alu_8bit_test;

    //Inputs
    reg [7:0] A;
    reg [7:0] B;

    reg Select, C;
    wire [7:0] Y;

    alu_8bit UUT (.A(A), .B(B), .Select(Select), .C(C), .Y(Y));

    integer total_test = 262144;
    integer total_passed = 262144;

    initial begin
        $dumpfile("alu_8bit.vcd");
        $dumpvars(0,alu_8bit_test);
        $display("Test begin.");

        for(integer i = 0; i < 2**18; i++)
        begin
            A = i[7:0];
            B = i[15:8];
            Select = i[16];
            C = i[17];
            #20;
            if (C == 1 && Select == 1 && Y != A + B)
            begin
                $display("Test failed for %d + %d", A, B);
                total_passed = total_passed - 1;
            end
            else if (C == 1 & Select == 1 && Y != A - B)
            begin
                $display("Test failed for %d - %d", A, B);
                total_passed = total_passed - 1;
            end
        end
    $display("Test end.");
    $display("%d of %d tests passed.", total_passed, total_test);
    end
endmodule