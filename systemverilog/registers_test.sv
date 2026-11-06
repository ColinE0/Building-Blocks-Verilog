`timescale 1ns/1ps

module registers_test;

    // Inputs
    logic CLK = 1'b0;
    logic Load, SH, SU;
    logic [4:0] A;

    // Output
    logic [4:0] Z;

    // Expected register value, starts at the power-up value
    logic [8:0] expected = 9'd135;

    integer checks = 0;
    integer errors = 0;

    // Unit Under Test
    div UUT (.A(A), .Load(Load), .SH(SH), .CLK(CLK), .SU(SU), .Z(Z));

    // Compare the register and Z against the expected value
    task check(input string name);
        checks = checks + 1;
        if (UUT.Q !== expected || Z !== expected[8:4]) begin
            $display("FAIL: %s, Q = %b expected %b", name, UUT.Q, expected);
            errors = errors + 1;
        end
    endtask

    initial begin
        if ($test$plusargs("waves")) begin
            $dumpfile("registers_test.vcd");
            $dumpvars(0, registers_test);
        end
        $display("Start of test.");

        Load = 0; SH = 0; SU = 0; A = 0;
        #1;
        check("power-up value");

        // Every A, SU, SH, and Load combination. Shift wins when SH and Load are both 1.
        for (int i = 0; i < 256; i++) begin
            {A, SU, SH, Load} = i[7:0];
            #1;
            check("no clock");
            if (SH)        expected = {expected[7:0], 1'b0};
            else if (Load) expected = {A, expected[3:1], SU};
            CLK = 1'b1; #1;
            check("rising edge");
            CLK = 1'b0; #1;
            check("falling edge");
        end

        if (errors == 0) $display("PASS: registers_test, %0d checks", checks);
        else             $display("FAIL: registers_test, %0d of %0d checks failed", errors, checks);
        $finish;
    end

endmodule
