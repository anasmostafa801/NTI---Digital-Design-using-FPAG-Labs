module DEMUX (
    input wire Din,
    input wire [1:0] Sel,
    output reg [3:0] Y
);

always @(*) begin
    Y = 4'b0;
  case(Sel)
  00: Y[0] = Din;
  01: Y[1] = Din;
  10: Y[2] = Din;
  11: Y[3] = Din;
  endcase
end
endmodule