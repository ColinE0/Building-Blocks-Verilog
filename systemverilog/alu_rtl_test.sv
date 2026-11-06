`timescale 1ns/1ps

module alu_rtl_test;

    // Inputs
    logic [7:0] A, B;
    logic S, E;

    // Output
    logic [7:0] W;

    logic [7:0] expected;
    integer errors = 0;

    // Unit Under Test
    alu_rtl UUT (.A(A), .B(B), .S(S), .E(E), .W(W));

    initial begin
        if ($test$plusargs("waves")) begin
            $dumpfile("alu_rtl_test.vcd");
            $dumpvars(0, alu_rtl_test);
        end
        $display("Start of test.");

        // Every A, B, S, and E combination
        for (int i = 0; i < 262144; i++) begin
            {E, S, B, A} = i[17:0];
            if (!E)      expected = 8'd0;
            else if (!S) expected = A + B;
            else         expected = A - B;
            #1;
            if (W !== expected) begin
                $display("FAIL: A = %0d, B = %0d, S = %b, E = %b gave %0d, expected %0d",
                         A, B, S, E, W, expected);
                errors = errors + 1;
            end
        end

        if (errors == 0) $display("PASS: alu_rtl_test, 262144 cases");
        else             $display("FAIL: alu_rtl_test, %0d of 262144 cases failed", errors);
        $finish;
    end

endmodule
