`include "controlS.v"

module controller_test;
    reg CLK = 1'b0, ST = 1'b0;
    wire SH, LD, D;
    controller UUT(CLK, ST, SH, LD, D);
    initial begin
        $display("STATE = %b, SH = %b, LD = %b, D = %b", UUT.STATE, SH, LD, D);
        ST = 1'd1; #5; CLK = 1'd1; #5; CLK = 1'd0; #5;
        $display("STATE = %b, SH = %b, LD = %b, D = %b", UUT.STATE, SH, LD, D);
        ST = 1'd0; #5; CLK = 1'd1; #5; CLK = 1'd0; #5;
        $display("STATE = %b, SH = %b, LD = %b, D = %b", UUT.STATE, SH, LD, D);
        ST = 1'd0; #5; CLK = 1'd1; #5; CLK = 1'd0; #5;
        $display("STATE = %b, SH = %b, LD = %b, D = %b", UUT.STATE, SH, LD, D);
        ST = 1'd0; #5; CLK = 1'd1; #5; CLK = 1'd0; #5;
        $display("STATE = %b, SH = %b, LD = %b, D = %b", UUT.STATE, SH, LD, D);
        ST = 1'd0; #5; CLK = 1'd1; #5; CLK = 1'd0; #5;
        $display("STATE = %b, SH = %b, LD = %b, D = %b", UUT.STATE, SH, LD, D);
        ST = 1'd0; #5; CLK = 1'd1; #5; CLK = 1'd0; #5;
        $display("STATE = %b, SH = %b, LD = %b, D = %b", UUT.STATE, SH, LD, D);
        ST = 1'd0; #5; CLK = 1'd1; #5; CLK = 1'd0; #5;
        $display("STATE = %b, SH = %b, LD = %b, D = %b", UUT.STATE, SH, LD, D);
        ST = 1'd0; #5; CLK = 1'd1; #5; CLK = 1'd0; #5;
        $display("STATE = %b, SH = %b, LD = %b, D = %b", UUT.STATE, SH, LD, D);
    end
endmodule