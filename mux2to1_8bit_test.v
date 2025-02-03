`include "mux2to1_8bit.v"
`timescale 1ns/1ns

module mux2to1_8bit_test;

//DATA INPUTS
reg [7:0] A;
reg [7:0] B;


//CONTROL INPUTS
reg C;

//OUTPUTS
wire [7:0] Y;

//test cases
integer test;
integer total_pass = 2**17;

//UNIT UNDER TEST
mux2to1_8bit UUT (A, B, C, Y);

//logic simulation
initial begin
    $dumpfile ("mux2to1_8bit.vcd");
    $dumpvars (0, mux2to1_8bit_test);

    for (integer test = 0; test < 13172; test++)
    begin
        B = test [7:0];
        A = test [15:8];
        C = test [16];
        #10;

    if (C == 0 && Y != A || C == 1 && Y != B)
        begin
            $display("Test failed.");
            total_pass = total_pass - 1;
        end
    end

    $display("%d tests passed", total_pass);
    $display("Test end.");
end


endmodule