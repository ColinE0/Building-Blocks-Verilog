`timescale 1ns/1ps

module alu_accum_test;

    // Inputs
    logic CLK = 1'b0;
    logic CLR, E, S;
    logic [7:0] B;

    // Output
    logic [7:0] Q;

    // Expected accumulator value
    logic [7:0] expected = 8'd0;

    integer checks = 0;
    integer errors = 0;

    // Unit Under Test
    alu_accum UUT (.CLK(CLK), .CLR(CLR), .Q(Q), .B(B), .E(E), .S(S));

    // Compare Q against the expected value, count and report a mismatch
    task check(input string name);
        checks = checks + 1;
        if (Q !== expected) begin
            $display("FAIL: %s, Q = %0d expected %0d at %0t", name, Q, expected, $time);
            errors = errors + 1;
        end
    endtask

    initial begin
        if ($test$plusargs("waves")) begin
            $dumpfile("alu_accum_test.vcd");
            $dumpvars(0, alu_accum_test);
        end
        $display("Start of test.");

        // Synchronous reset, taken on the falling edge
        CLR = 1; E = 1; S = 0; B = 0;
        #1; CLK = 1; #1; CLK = 0; #1;
        check("reset");

        // Every B, CLR, E, and S combination, with the total carried from one to the next
        for (int i = 0; i < 2048; i++) begin
            {B, CLR, E, S} = i[10:0];
            #1;
            check("no clock");
            CLK = 1; #1;
            check("rising edge");
            if (CLR || !E) expected = 8'd0;
            else if (S)    expected = expected - B;
            else           expected = expected + B;
            CLK = 0; #1;
            check("falling edge");
        end

        // Add past 255, then subtract past 0
        CLR = 0; E = 1; S = 0; B = 8'd200;
        for (int i = 0; i < 4; i++) begin
            #1; CLK = 1; #1;
            expected = expected + B;
            CLK = 0; #1;
            check("add wraparound");
        end
        S = 1; B = 8'd100;
        for (int i = 0; i < 4; i++) begin
            #1; CLK = 1; #1;
            expected = expected - B;
            CLK = 0; #1;
            check("subtract wraparound");
        end

        if (errors == 0) $display("PASS: alu_accum_test, %0d checks", checks);
        else             $display("FAIL: alu_accum_test, %0d of %0d checks failed", errors, checks);
        $finish;
    end

endmodule
