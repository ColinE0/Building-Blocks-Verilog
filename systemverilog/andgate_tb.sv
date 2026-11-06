`timescale 1ns/1ps

module andgate_tb;

    // Inputs
    logic A, B;

    // Output
    logic F;

    integer errors = 0;

    // Unit Under Test
    andgate UUT (.A(A), .B(B), .F(F));

    initial begin
        if ($test$plusargs("waves")) begin
            $dumpfile("andgate_tb.vcd");
            $dumpvars(0, andgate_tb);
        end
        $display("Start of test.");

        // Truth table
        for (int i = 0; i < 4; i++) begin
            {A, B} = i[1:0];
            #1;
            if (F !== (A & B)) begin
                $display("FAIL: %b & %b = %b", A, B, F);
                errors = errors + 1;
            end
        end

        if (errors == 0) $display("PASS: andgate_tb, 4 cases");
        else             $display("FAIL: andgate_tb, %0d of 4 cases failed", errors);
        $finish;
    end

endmodule
