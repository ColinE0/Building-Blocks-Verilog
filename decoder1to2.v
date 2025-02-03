module decoder1to2 (A,Y);

//Input
input A;

//output
output [1:0] Y;


//Assignments
assign Y[1] = ~A;
assign Y[0] = A;

endmodule