`include "half_adder.v"
`timescale 1ps/1ps

module half_adder_test;

    reg A, B;
    wire C, S;

    top UUT(A, B, C, S);

    initial begin
        $display("Start of Test.");
        $dumpfile("half_adder.vcd");
        $dumpvars(0, half_adder_test);
        {A, B} = 4'b0000; #10; $display("%b + %b = %b%b", A, B, C, S);
        {A, B} = 4'b0001; #10; $display("%b + %b = %b%b", A, B, C, S);
        {A, B} = 4'b0010; #10; $display("%b + %b = %b%b", A, B, C, S);
        {A, B} = 4'b0011; #10; $display("%b + %b = %b%b", A, B, C, S);
        {A, B} = 4'b0100; #10; $display("%b + %b = %b%b", A, B, C, S);
        {A, B} = 4'b0101; #10; $display("%b + %b = %b%b", A, B, C, S);
        {A, B} = 4'b0110; #10; $display("%b + %b = %b%b", A, B, C, S);
        {A, B} = 4'b0111; #10; $display("%b + %b = %b%b", A, B, C, S);
        $display("End of Test.");
    end

endmodule