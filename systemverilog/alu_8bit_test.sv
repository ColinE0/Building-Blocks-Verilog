`timescale 1ns/1ps

module alu_8bit_test;

    // Inputs
    logic [7:0] A, B;
    logic Select, C;

    // Output
    logic [7:0] Y;

    logic [7:0] expected;
    integer errors = 0;

    // Unit Under Test
    alu_8bit UUT (.A(A), .B(B), .Select(Select), .C(C), .Y(Y));

    initial begin
        if ($test$plusargs("waves")) begin
            $dumpfile("alu_8bit_test.vcd");
            $dumpvars(0, alu_8bit_test);
        end
        $display("Start of test.");

        // Every A, B, Select, and C combination
        for (int i = 0; i < 262144; i++) begin
            {C, Select, B, A} = i[17:0];
            if (!C)           expected = 8'd0;
            else if (!Select) expected = A + B;
            else              expected = A - B;
            #1;
            if (Y !== expected) begin
                $display("FAIL: A = %0d, B = %0d, Select = %b, C = %b gave %0d, expected %0d",
                         A, B, Select, C, Y, expected);
                errors = errors + 1;
            end
        end

        if (errors == 0) $display("PASS: alu_8bit_test, 262144 cases");
        else             $display("FAIL: alu_8bit_test, %0d of 262144 cases failed", errors);
        $finish;
    end

endmodule
