`timescale 1ns/1ps

module subtractor_8bit_test;

    // Inputs
    logic [7:0] A, B;

    // Output
    logic [7:0] Diff;

    logic [7:0] expected;
    integer errors = 0;

    // Unit Under Test
    subtractor_8bit UUT (.A(A), .B(B), .Diff(Diff));

    initial begin
        if ($test$plusargs("waves")) begin
            $dumpfile("subtractor_8bit_test.vcd");
            $dumpvars(0, subtractor_8bit_test);
        end
        $display("Start of test.");

        // Every A, B pair
        for (int i = 0; i < 65536; i++) begin
            A = i[7:0];
            B = i[15:8];
            expected = A - B;
            #1;
            if (Diff !== expected) begin
                $display("FAIL: %0d - %0d = %0d, expected %0d", A, B, Diff, expected);
                errors = errors + 1;
            end
        end

        if (errors == 0) $display("PASS: subtractor_8bit_test, 65536 cases");
        else             $display("FAIL: subtractor_8bit_test, %0d of 65536 cases failed", errors);
        $finish;
    end

endmodule
