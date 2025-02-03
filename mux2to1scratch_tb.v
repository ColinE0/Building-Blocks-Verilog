`timescale 1ns/1ns
`include "mux2to1scratch.v"

module mux2to1scratch_tb;

//inputs
reg A;
reg B;

//control input
reg C;

//output
wire Y;

//Unit under testing

mux2to1scratch UUT (A, B, C, Y);

//simulation stuff
initial begin
    $dumpfile("mux2to1scratch.vcd");
    $dumpvars(0, mux2to1scratch_tb);

    for(integer i = 0; i < 8; i=i+1) begin
        {A, B, C} = i;#10

        if (Y != ((A&~C | (B & C)))) begin
            $display("Test case FAILED for minterm %d", i);
        end
        else begin
            $display("test case PASSED for minterm %d", i);
        end

    end
    $finish;
end

endmodule