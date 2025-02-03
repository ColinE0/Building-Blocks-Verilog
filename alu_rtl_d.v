module alu_rtl (A, B, S, E, W);

//DATA
input [7:0] A, B;
//CONTROL
input S, E;
//OUTPUT REGISTER
output reg [7:0] W;

always @(*) begin
    if (E == 1) begin 
        if (S == 0) begin
            W <= A + B;
        end else begin
            W <= A - B;
        end
    end else begin 
        W <= 8'd0;
    end 
end
endmodule 