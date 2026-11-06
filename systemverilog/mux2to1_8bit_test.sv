`timescale 1ns/1ps

module mux2to1_8bit_test;

    // Inputs
    logic [7:0] A, B;
    logic C;

    // Output
    logic [7:0] Y;

    integer errors = 0;

    // Unit Under Test
    mux2to1_8bit UUT (.A(A), .B(B), .C(C), .Y(Y));

    initial begin
        if ($test$plusargs("waves")) begin
            $dumpfile("mux2to1_8bit_test.vcd");
            $dumpvars(0, mux2to1_8bit_test);
        end
        $display("Start of test.");

        // Every A, B, and select combination
        for (int i = 0; i < 131072; i++) begin
            {A, B, C} = i[16:0];
            #1;
            if (Y !== (C ? B : A)) begin
                $display("FAIL: A = %h, B = %h, C = %b gave Y = %h", A, B, C, Y);
                errors = errors + 1;
            end
        end

        if (errors == 0) $display("PASS: mux2to1_8bit_test, 131072 cases");
        else             $display("FAIL: mux2to1_8bit_test, %0d of 131072 cases failed", errors);
        $finish;
    end

endmodule
