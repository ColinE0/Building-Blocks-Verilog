`include "adder_8bit.v"


module adder_8bit_test;

    reg [7:0] A;
    reg [7:0] B;

    wire [7:0] S;

    integer total_test = 65536;
    integer total_passed = 65536;

    adder_8bit UUT(A, B, S);

    initial begin
        $dumpfile("adder_8bit_test.vcd");
        $dumpvars(0, adder_8bit_test);
        $display("Test Begin: \n");
        for (integer i = 0; i < total_test; i++)
        begin
            A = i[7:0];
            B = i[15:8];
            #20;
            if({S} != A + B)
            begin
                $display("failed for %b + %b ", A, B);
                total_passed = total_passed - 1;
            end
        end
        $display("End of Test.");
        $display("%d of %d tests passed", total_passed, total_test);
    end
endmodule