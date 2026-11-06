`timescale 1ns/1ps

module shift_test;

    // Inputs
    logic CLK = 1'b0;
    logic SIN, SH, LD;
    logic [7:0] PIN;

    // Outputs
    logic SOUT;
    logic [7:0] POUT;

    // Expected register value
    logic [7:0] expected = 8'd0;

    integer checks = 0;
    integer errors = 0;

    // Unit Under Test
    shift UUT (.CLK(CLK), .SIN(SIN), .SH(SH), .LD(LD),
               .PIN(PIN), .SOUT(SOUT), .POUT(POUT));

    // Compare SOUT and POUT against the expected register value
    task check(input string name);
        checks = checks + 1;
        if ({SOUT, POUT} !== {expected[0], expected}) begin
            $display("FAIL: %s, POUT = %b SOUT = %b expected %b", name, POUT, SOUT, expected);
            errors = errors + 1;
        end
    endtask

    initial begin
        if ($test$plusargs("waves")) begin
            $dumpfile("shift_test.vcd");
            $dumpvars(0, shift_test);
        end
        $display("Start of test.");

        SIN = 0; SH = 0; LD = 0; PIN = 0;
        #1;
        check("power-up value");

        // Every PIN, SIN, SH, and LD combination. Shift wins when SH and LD are both 1.
        for (int i = 0; i < 2048; i++) begin
            {PIN, SIN, SH, LD} = i[10:0];
            #1;
            check("no clock");
            if (SH)      expected = {SIN, expected[7:1]};
            else if (LD) expected = PIN;
            CLK = 1'b1; #1;
            check("rising edge");
            CLK = 1'b0; #1;
            check("falling edge");
        end

        if (errors == 0) $display("PASS: shift_test, %0d checks", checks);
        else             $display("FAIL: shift_test, %0d of %0d checks failed", errors, checks);
        $finish;
    end

endmodule
