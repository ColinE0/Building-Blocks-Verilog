`timescale 1ns/1ns
`include "mux2to1.v"

module mux2to1_tb;

//inputs
reg A;
reg B;

// control input
reg C;

//output
wire Y;

// unit under test
mux2to1 UUT (A, B, C, Y);

// logic simulation
initial begin
    $dumpfile("mux2to1.vcd");
    $dumpvars(0, mux2to1_tb);

    for(integer i = 0; i < 8; i=i+1) begin
        {A, B, C} = i;#10

        if (Y != ((A&~C | (B & C)))) begin
            $display("Test case FAILED for minterm %d", i);
        end
        else begin
            $display("test case passed for minterm %d", i);
        end

    end
    $finish;
end

endmodule