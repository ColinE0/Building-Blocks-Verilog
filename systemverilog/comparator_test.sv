`timescale 1ns/1ps

module comparator_test;

    // Inputs
    logic [1:0] A, B;

    // Outputs
    logic A_less_B, A_equal_B, A_greater_B;

    integer errors = 0;

    // Unit Under Test
    comparator UUT (.A(A), .B(B), .A_less_B(A_less_B),
                    .A_equal_B(A_equal_B), .A_greater_B(A_greater_B));

    initial begin
        if ($test$plusargs("waves")) begin
            $dumpfile("comparator_test.vcd");
            $dumpvars(0, comparator_test);
        end
        $display("Start of test.");

        // Every A, B pair
        for (int i = 0; i < 16; i++) begin
            {A, B} = i[3:0];
            #1;
            if (A_less_B !== (A < B) || A_equal_B !== (A == B) || A_greater_B !== (A > B)) begin
                $display("FAIL: A = %0d, B = %0d gave less/equal/greater = %b%b%b",
                         A, B, A_less_B, A_equal_B, A_greater_B);
                errors = errors + 1;
            end
        end

        if (errors == 0) $display("PASS: comparator_test, 16 cases");
        else             $display("FAIL: comparator_test, %0d of 16 cases failed", errors);
        $finish;
    end

endmodule
