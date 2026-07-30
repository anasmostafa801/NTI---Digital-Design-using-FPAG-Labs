module lab1_mux2x1_2bitWide (
    input wire [1:0] a, b, 
    input sel,
    output wire [1:0] y
);

assign y = (~sel&a) | (sel&b);

endmodule