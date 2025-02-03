`include "full_adder.v"
`timescale 10ns/1ns

module full_test;

    reg A, B, Cin;
    
    wire S, Cout;

    top UUT(A, B, Cin, S, Cout);

    initial begin
        $display("Start of Test.");
        $dumpfile("full.vcd");
        $dumpvars(0, full_test);
        {A, B, Cin} = 4'd0; #10; $display("%d + %d + %d = %d", A, B, Cin, S, Cout);
        {A, B, Cin} = 4'd1; #10; $display("%d + %d + %d = %d", A, B, Cin, S, Cout);
        {A, B, Cin} = 4'd2; #10; $display("%d + %d + %d = %d", A, B, Cin, S, Cout);
        {A, B, Cin} = 4'd3; #10; $display("%d + %d + %d = %d", A, B, Cin, S, Cout);
        {A, B, Cin} = 4'd4; #10; $display("%d + %d + %d = %d", A, B, Cin, S, Cout);
        {A, B, Cin} = 4'd5; #10; $display("%d + %d + %d = %d", A, B, Cin, S, Cout);
        {A, B, Cin} = 4'd6; #10; $display("%d + %d + %d = %d", A, B, Cin, S, Cout);
        {A, B, Cin} = 4'd7; #10; $display("%d + %d + %d = %d", A, B, Cin, S, Cout);
        $display("End of Test.");
    end

endmodule