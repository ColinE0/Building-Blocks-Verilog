`timescale 1ns/1ps

module subtractor_test;

    // Inputs
    logic [4:0] Zin, Cin;

    // Outputs
    logic [4:0] Cout;
    logic comp;

    logic [4:0] expected;
    integer errors = 0;

    // Unit Under Test
    subtractor UUT (.Zin(Zin), .Cin(Cin), .Cout(Cout), .comp(comp));

    initial begin
        if ($test$plusargs("waves")) begin
            $dumpfile("subtractor_test.vcd");
            $dumpvars(0, subtractor_test);
        end
        $display("Start of test.");

        // Every Zin, Cin pair. comp is 1 when Cin < Zin.
        for (int i = 0; i < 1024; i++) begin
            {Zin, Cin} = i[9:0];
            expected = Cin - Zin;
            #1;
            if (Cout !== expected || comp !== (Cin < Zin)) begin
                $display("FAIL: %0d - %0d gave %0d, comp = %b", Cin, Zin, Cout, comp);
                errors = errors + 1;
            end
        end

        if (errors == 0) $display("PASS: subtractor_test, 1024 cases");
        else             $display("FAIL: subtractor_test, %0d of 1024 cases failed", errors);
        $finish;
    end

endmodule
