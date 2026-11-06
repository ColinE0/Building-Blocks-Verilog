`timescale 1ns/1ps

module mux2to1_tb;

    // Inputs
    logic A, B;
    logic C;

    // Output
    logic Y;

    integer errors = 0;

    // Unit Under Test
    mux2to1 UUT (.A(A), .B(B), .C(C), .Y(Y));

    initial begin
        if ($test$plusargs("waves")) begin
            $dumpfile("mux2to1_tb.vcd");
            $dumpvars(0, mux2to1_tb);
        end
        $display("Start of test.");

        // Truth table
        for (int i = 0; i < 8; i++) begin
            {A, B, C} = i[2:0];
            #1;
            if (Y !== (C ? B : A)) begin
                $display("FAIL: A = %b, B = %b, C = %b gave Y = %b", A, B, C, Y);
                errors = errors + 1;
            end
        end

        if (errors == 0) $display("PASS: mux2to1_tb, 8 cases");
        else             $display("FAIL: mux2to1_tb, %0d of 8 cases failed", errors);
        $finish;
    end

endmodule
