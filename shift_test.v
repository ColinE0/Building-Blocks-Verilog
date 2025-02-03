`include "shift.v"
`timescale 1ps/1ps

module shift_test;
    //Input
    reg CLK = 1'b0, SIN = 1'b0, SH = 1'b0, LD = 1'b0;
    reg [7:0] PIN = 8'd0;
    
    //Wires
    wire SOUT;
    wire [7:0] POUT;

    //Unit Under Test
    shift UUT(CLK, SIN, SH, LD, PIN, SOUT, POUT);
    initial begin
        
        $display("Done | Dividend | Divisor");
        PIN = 8'd135; #5; $display("Q =    %b", POUT);
        {SH, LD} = 4'b01; #5; CLK = 1'd1; #5; CLK = 1'd0; #5; $display("Q =    %b", POUT);
        {SH, LD} = 4'b11; #5; CLK = 1'd1; #5; CLK = 1'd0; #5; $display("Q =    %b", POUT);
        {SH, LD} = 4'b11; #5; CLK = 1'd1; #5; CLK = 1'd0; #5; $display("Q =    %b", POUT);
        {SH, LD} = 4'b00; #5; CLK = 1'd1; #5; CLK = 1'd0; #5; $display("Q =    %b", POUT);
        SIN = 1'b1; #5;
        {SH, LD} = 4'b00; #5; CLK = 1'd1; #5; CLK = 1'd0; #5; $display("Q =    %b", POUT);
        
        
        $display("Test Terminated.");

    end

endmodule