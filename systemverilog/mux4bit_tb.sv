`timescale 1ns/1ps

module mux4bit_tb;

    // Inputs
    logic [3:0] A, B;
    logic C;

    // Output
    logic [3:0] Y;

    integer errors = 0;

    // Unit Under Test
    mux4bit UUT (.A(A), .B(B), .C(C), .Y(Y));

    initial begin
        if ($test$plusargs("waves")) begin
            $dumpfile("mux4bit_tb.vcd");
            $dumpvars(0, mux4bit_tb);
        end
        $display("Start of test.");

        // Every A, B, and select combination
        for (int i = 0; i < 512; i++) begin
            {A, B, C} = i[8:0];
            #1;
            if (Y !== (C ? B : A)) begin
                $display("FAIL: A = %h, B = %h, C = %b gave Y = %h", A, B, C, Y);
                errors = errors + 1;
            end
        end

        if (errors == 0) $display("PASS: mux4bit_tb, 512 cases");
        else             $display("FAIL: mux4bit_tb, %0d of 512 cases failed", errors);
        $finish;
    end

endmodule
