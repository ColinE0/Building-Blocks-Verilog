`timescale 1ns/1ps

// Same as mux2to1_test.v, this one tests the 8-bit mux.
module mux2to1_test;

    // Inputs
    logic [7:0] A, B;
    logic C;

    // Output
    logic [7:0] Y;

    integer checks = 0;
    integer errors = 0;

    // Unit Under Test
    mux2to1_8bit UUT (.A(A), .B(B), .C(C), .Y(Y));

    // Compare Y against the expected value, count and report a mismatch
    task check(input string name, input logic [7:0] expected);
        checks = checks + 1;
        if (Y !== expected) begin
            $display("FAIL: %s, Y = %b expected %b", name, Y, expected);
            errors = errors + 1;
        end
    endtask

    initial begin
        if ($test$plusargs("waves")) begin
            $dumpfile("mux2to1_test.vcd");
            $dumpvars(0, mux2to1_test);
        end
        $display("Start of test.");

        // Walking 1 on A, walking 0 on B, with both selects
        for (int i = 0; i < 8; i++) begin
            A = 8'b1 << i;
            B = ~A;
            C = 1'b0; #1; check("C = 0 selects A", A);
            C = 1'b1; #1; check("C = 1 selects B", B);
        end

        // Unknown select. The gate-level mux still gives 0 when both inputs are 0.
        A = 8'h00; B = 8'h00; C = 1'bx; #1; check("C = x, inputs 0", 8'h00);
        A = 8'hff; B = 8'hff;           #1; check("C = x, inputs 1", 8'hxx);
        A = 8'ha5; B = 8'h5a; C = 1'bz; #1; check("C = z", 8'hxx);

        if (errors == 0) $display("PASS: mux2to1_test, %0d checks", checks);
        else             $display("FAIL: mux2to1_test, %0d of %0d checks failed", errors, checks);
        $finish;
    end

endmodule
