`include "divider.v"
`timescale 1ps/1ps

module divider_test;

    reg CLK =0;
    reg ST = 0; 

    reg [4:0] Y1 = 5'd13;
    reg [4:0] Y2 = 5'd4;

    reg SHIFT = 0;
    reg LOAD = 0;

    // Wires 
    wire Done;
 
    // Unit Under Test 
    top UUT(.CLK(CLK), .STATE(STATE), .Y1(Y1), .Y2(Y2), .Done(Done));

    initial begin 
        $display("Begin Test");
        $dumpfile("divider_test.vcd");
        $dumpvars(0, divider_test);

        UUT.dividend.Q = 8'd165;

        $display("135 / 13 = %dR%d", UUT.dividend.Q[8:4], UUT.dividend.Q[3:0]);

        UUT.dividend.Q = 8'd6;

        $display("%d / %d = 1R2", UUT.dividend.Q, Y2);
        $display("End of Test");
        $finish;
    end
endmodule