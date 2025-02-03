`include "decoder1to2.v"
`timescale 1ns/1ns

module decoder1to2_test;
reg A;
wire [1:0] Y;

decoder1to2 UUT (A,Y);

initial begin
    $display("Start of test.");
    $dumpfile("decoder1to2.vcd");
    $dumpvars(0,decoder1to2_test);
    {A} = 2'b0; #10; $display(A, " = %b", Y);
    {A} = 2'b1; #10; $display(A, " = %b", Y);
    $display("End of Test.");

end

endmodule