`timescale 1ns/1ps

module controller_test;

    // Inputs
    logic clock = 1'b0;
    logic START = 1'b0;

    // Outputs, one controller with comp = 0 and one with comp = 1
    wire DONE0, SHIFT0, LOAD0;
    wire DONE1, SHIFT1, LOAD1;

    integer checks = 0;
    integer errors = 0;

    // Units Under Test
    control UUT0 (.START(START), .comp(1'b0), .clock(clock),
                  .DONE(DONE0), .SHIFT(SHIFT0), .LOAD(LOAD0));
    control UUT1 (.START(START), .comp(1'b1), .clock(clock),
                  .DONE(DONE1), .SHIFT(SHIFT1), .LOAD(LOAD1));

    // One clock pulse
    task tick;
        #1; clock = 1; #1;
        clock = 0; #1;
    endtask

    // Compare {DONE, SHIFT, LOAD} of both controllers
    task check(input string name, input logic [5:0] expected);
        checks = checks + 1;
        if ({DONE0, SHIFT0, LOAD0, DONE1, SHIFT1, LOAD1} !== expected) begin
            $display("FAIL: %s, outputs = %b expected %b", name,
                     {DONE0, SHIFT0, LOAD0, DONE1, SHIFT1, LOAD1}, expected);
            errors = errors + 1;
        end
    endtask

    // Compare the state of both controllers
    task check_state(input string name, input logic [3:0] state0, input logic [3:0] state1);
        checks = checks + 1;
        if (UUT0.STATE !== state0 || UUT1.STATE !== state1) begin
            $display("FAIL: %s, STATE = %0d and %0d expected %0d and %0d", name,
                     UUT0.STATE, UUT1.STATE, state0, state1);
            errors = errors + 1;
        end
    endtask

    initial begin
        if ($test$plusargs("waves")) begin
            $dumpfile("controller_test.vcd");
            $dumpvars(0, controller_test);
        end
        $display("Start of test.");

        #1;
        check("power-up outputs", 6'b000_000);

        // No START yet, so the default case drives X on the outputs
        tick;
        check_state("idle", 0, 0);
        check("idle outputs", 6'bxxx_xxx);

        // START, first shift
        START = 1; tick;
        START = 0;
        check("start", 6'b010_010);

        // Four compare and shift rounds. comp = 0 loads (S2), comp = 1 does not (S3).
        for (int i = 0; i < 4; i++) begin
            tick;
            check_state("compare", 2, 3);
            checks = checks + 1;
            if (UUT0.count !== 3 - i || UUT1.count !== 3 - i) begin
                $display("FAIL: count = %0d and %0d expected %0d", UUT0.count, UUT1.count, 3 - i);
                errors = errors + 1;
            end
            check("compare outputs", 6'b001_000);
            tick;
            if (i < 3) begin
                check_state("next round", 1, 1);
                check("shift outputs", 6'b010_010);
            end
            else begin
                check_state("done", 4, 4);
                check("done outputs", 6'b100_100);
            end
        end

        // No restart, DONE stays high even with START
        START = 1; tick;
        check("DONE holds", 6'b100_100);

        if (errors == 0) $display("PASS: controller_test, %0d checks", checks);
        else             $display("FAIL: controller_test, %0d of %0d checks failed", errors, checks);
        $finish;
    end

endmodule
