`include mux2to1.v

module mux4bit ( A, B , C , Y);

// DATA INPUTS
input [3:0] A; // A3 A2 A1 A0
input [3:0] B; // B3 B2 B1 B0


// CONTROL INPUTS
input C;

// OUTPUTS
output reg [3:0] Y;

//LOGIC CIRCUIT
always @(*) begin
    if (C == 0) begin
        Y = A;
    end
    else begin
        Y = B;
    end
end

endmodule