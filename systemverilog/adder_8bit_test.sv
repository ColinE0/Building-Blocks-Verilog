`timescale 1ns/1ps

module adder_8bit_test;

    // Inputs
    logic [7:0] A, B;

    // Output
    logic [7:0] S;

    logic [7:0] expected;
    integer errors = 0;

    // Unit Under Test
    adder_8bit UUT (.A(A), .B(B), .S(S));

    initial begin
        if ($test$plusargs("waves")) begin
            $dumpfile("adder_8bit_test.vcd");
            $dumpvars(0, adder_8bit_test);
        end
        $display("Start of test.");

        // Every A, B pair
        for (int i = 0; i < 65536; i++) begin
            A = i[7:0];
            B = i[15:8];
            expected = A + B;
            #1;
            if (S !== expected) begin
                $display("FAIL: %0d + %0d = %0d, expected %0d", A, B, S, expected);
                errors = errors + 1;
            end
        end

        if (errors == 0) $display("PASS: adder_8bit_test, 65536 cases");
        else             $display("FAIL: adder_8bit_test, %0d of 65536 cases failed", errors);
        $finish;
    end

endmodule
