module Four_Bit_Adder (
    input wire [3:0] A, B,
    output wire Cin,
    output wire [3:0] S,
    output wire Cout
);

wire [2:0] C;

FA FA0 (.A(A[0]), .B(B[0]), .Cin(Cin),  .S(S[0]), .Cout(C[0]));
FA FA1 (.A(A[1]), .B(B[1]), .Cin(C[0]), .S(S[1]), .Cout(C[1]));
FA FA2 (.A(A[2]), .B(B[2]), .Cin(C[1]), .S(S[2]), .Cout(C[2]));
FA FA3 (.A(A[3]), .B(B[3]), .Cin(C[2]), .S(S[3]), .Cout(Cout));

endmodule