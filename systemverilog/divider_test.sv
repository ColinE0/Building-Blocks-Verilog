`timescale 1ns/1ps

// Smoke test only. The divider is still a work in progress, so this just
// checks that it builds and runs. See README.md.
module divider_test;

    // Inputs
    logic CLK = 1'b0;
    logic ST = 1'b0;
    logic [4:0] Y1 = 5'd13;
    logic [4:0] Y2 = 5'd4;

    // Output
    wire Done;

    // Unit Under Test
    top UUT (.CLK(CLK), .STATE(ST), .Y1(Y1), .Y2(Y2), .Done(Done));

    initial begin
        if ($test$plusargs("waves")) begin
            $dumpfile("divider_test.vcd");
            $dumpvars(0, divider_test);
        end
        $display("Start of test.");

        #1;
        $display("Dividend register at power-up = %0d", UUT.dividend.Q);
        ST = 1;
        repeat (12) begin
            #1; CLK = 1;
            #1; CLK = 0;
        end

        $display("SMOKE: divider_test ran, division is not checked yet");
        $finish;
    end

endmodule
