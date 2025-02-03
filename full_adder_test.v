`include "full_adder.v"
`timescale 10ns/1ns

module full_adder_test;

    reg A, B, Cin;
    
    wire w0, w1, w2, Sum, Cout;

    full_adder UUT(A, B, Cin, Cout, Sum);

    initial begin
        $display("Start of Test.");
        $dumpfile("full_adder.vcd");
        $dumpvars(0, full_adder_test);
        {A, B, Cin} = 4'd0; #10; $display("%d + %d + %d = %d",A, B, Cin, Cout, Sum);
        {A, B, Cin} = 4'd1; #10; $display("%d + %d + %d = %d",A, B, Cin, Cout, Sum);
        {A, B, Cin} = 4'd2; #10; $display("%d + %d + %d = %d",A, B, Cin, Cout, Sum);
        {A, B, Cin} = 4'd3; #10; $display("%d + %d + %d = %d",A, B, Cin, Cout, Sum);
        {A, B, Cin} = 4'd4; #10; $display("%d + %d + %d = %d",A, B, Cin, Cout, Sum);
        {A, B, Cin} = 4'd5; #10; $display("%d + %d + %d = %d",A, B, Cin, Cout, Sum);
        {A, B, Cin} = 4'd6; #10; $display("%d + %d + %d = %d",A, B, Cin, Cout, Sum);
        {A, B, Cin} = 4'd7; #10; $display("%d + %d + %d = %d",A, B, Cin, Cout, Sum);
        $display("End of Test.");
    end

endmodule