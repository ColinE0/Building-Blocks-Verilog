`timescale 1ns/1ps

module decoder1to2_test;

    // Input
    logic A;

    // Output
    logic [1:0] Y;

    integer errors = 0;

    // Unit Under Test
    decoder1to2 UUT (.A(A), .Y(Y));

    initial begin
        if ($test$plusargs("waves")) begin
            $dumpfile("decoder1to2_test.vcd");
            $dumpvars(0, decoder1to2_test);
        end
        $display("Start of test.");

        // Both input values
        for (int i = 0; i < 2; i++) begin
            A = i[0];
            #1;
            if (Y !== (A ? 2'b01 : 2'b10)) begin
                $display("FAIL: A = %b gave Y = %b", A, Y);
                errors = errors + 1;
            end
        end

        if (errors == 0) $display("PASS: decoder1to2_test, 2 cases");
        else             $display("FAIL: decoder1to2_test, %0d of 2 cases failed", errors);
        $finish;
    end

endmodule
