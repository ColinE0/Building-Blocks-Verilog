// alu_accum_test.v
// Drives the accumulator.

`timescale 10ns/1ns

module alu_accum_test;

    reg        CLR;
    reg  [7:0] B;
    reg        E, S;
    reg  [7:0] count = 0;
    wire [7:0] Q;
    reg        CLK = 1'b0;

    always begin CLK <= ~CLK; #5; end

    alu_accum UUT (.CLK(CLK), .CLR(CLR), .Q(Q), .B(B), .E(E), .S(S));

    initial begin
        $dumpfile("alu_accum.vcd");
        $dumpvars(0, alu_accum_test);
        $display("Start of test.");

        E = 1; S = 0; CLR = 0;
        B = 0;  #10;
        B = 3;  #10;
        B = 7;  #10;
        B = 10; #50;
        S = 1;
        while (Q >= 12) begin
            B = 12;
            count = count + 1;
            #10;
        end

        $display("count = %0d", count);
        $display("Test terminated.");
        $finish;
    end

endmodule
