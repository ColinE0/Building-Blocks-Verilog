`include "controller.v"

module controller_test;

    //Inputs
    reg Cin = 1'b0, ST = 1'b0;

    //Outputs
    wire SH, LD, D;

    //Unit Under Test
    controller UUT(Cin, ST, SH, LD, D);
    initial begin
        $display("STATE = %b, SH = %b, LD = %b, D = %b", UUT.STATE, SH, LD, D);
        ST = 1'd1; #5; Cin = 1'd1; #5; Cin = 1'd0; #5;
        $display("STATE = %b, SH = %b, LD = %b, D = %b", UUT.STATE, SH, LD, D);
        ST = 1'd0; #5; Cin = 1'd1; #5; Cin = 1'd0; #5;
        $display("STATE = %b, SH = %b, LD = %b, D = %b", UUT.STATE, SH, LD, D);
        ST = 1'd0; #5; Cin = 1'd1; #5; Cin = 1'd0; #5;
        $display("STATE = %b, SH = %b, LD = %b, D = %b", UUT.STATE, SH, LD, D);
        ST = 1'd0; #5; Cin = 1'd1; #5; Cin = 1'd0; #5;
        $display("STATE = %b, SH = %b, LD = %b, D = %b", UUT.STATE, SH, LD, D);
        ST = 1'd0; #5; Cin = 1'd1; #5; Cin = 1'd0; #5;
        $display("STATE = %b, SH = %b, LD = %b, D = %b", UUT.STATE, SH, LD, D);
        ST = 1'd0; #5; Cin = 1'd1; #5; Cin = 1'd0; #5;
        $display("STATE = %b, SH = %b, LD = %b, D = %b", UUT.STATE, SH, LD, D);
        ST = 1'd0; #5; Cin = 1'd1; #5; Cin = 1'd0; #5;
        $display("STATE = %b, SH = %b, LD = %b, D = %b", UUT.STATE, SH, LD, D);
        ST = 1'd0; #5; Cin = 1'd1; #5; Cin = 1'd0; #5;
        $display("STATE = %b, SH = %b, LD = %b, D = %b", UUT.STATE, SH, LD, D);
    end
endmodule