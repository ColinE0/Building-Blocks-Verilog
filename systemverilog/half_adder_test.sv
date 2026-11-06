`timescale 1ns/1ps

module half_adder_test;

    // Inputs
    logic A, B;

    // Outputs
    logic C, S;

    logic [1:0] expected;
    integer errors = 0;

    // Unit Under Test
    half_adder UUT (.A(A), .B(B), .C(C), .Sum(S));

    initial begin
        if ($test$plusargs("waves")) begin
            $dumpfile("half_adder_test.vcd");
            $dumpvars(0, half_adder_test);
        end
        $display("Start of test.");

        // Truth table
        for (int i = 0; i < 4; i++) begin
            {A, B} = i[1:0];
            expected = A + B;
            #1;
            if ({C, S} !== expected) begin
                $display("FAIL: %b + %b = %b%b, expected %b", A, B, C, S, expected);
                errors = errors + 1;
            end
        end

        if (errors == 0) $display("PASS: half_adder_test, 4 cases");
        else             $display("FAIL: half_adder_test, %0d of 4 cases failed", errors);
        $finish;
    end

endmodule
