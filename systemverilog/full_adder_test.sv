`timescale 1ns/1ps

module full_adder_test;

    // Inputs
    logic A, B, Cin;

    // Outputs
    logic Cout, Sum;

    logic [1:0] expected;
    integer errors = 0;

    // Unit Under Test
    full_adder UUT (.A(A), .B(B), .Cin(Cin), .Cout(Cout), .Sum(Sum));

    initial begin
        if ($test$plusargs("waves")) begin
            $dumpfile("full_adder_test.vcd");
            $dumpvars(0, full_adder_test);
        end
        $display("Start of test.");

        // Truth table
        for (int i = 0; i < 8; i++) begin
            {A, B, Cin} = i[2:0];
            expected = A + B + Cin;
            #1;
            if ({Cout, Sum} !== expected) begin
                $display("FAIL: %b + %b + %b = %b%b, expected %b", A, B, Cin, Cout, Sum, expected);
                errors = errors + 1;
            end
        end

        if (errors == 0) $display("PASS: full_adder_test, 8 cases");
        else             $display("FAIL: full_adder_test, %0d of 8 cases failed", errors);
        $finish;
    end

endmodule
