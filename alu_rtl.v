module alu_rtl (A,B,S,E,W);

//INPUTS
input [7:0] A;
input [7:0] B;

//CONTROL INPUTS
input S;
input E;

//DATA OUTPUTS
output reg [7:0] W = 0;

//OPERATION
always @(*) begin
    if (E == 1) begin 
        if (S == 0) begin
            W <= A + B;
        end 
        else begin
            W <= A - B;
        end
    end 
    else begin 
        W <= 0;
    end 
end
endmodule