module FA (
    input wire A, B, Cin,
    output reg S, Cout
);

always @(*) begin
  case({A, B, Cin})
  000: begin
    S = 1'b0; Cout = 1'b0;
  end
  001: begin
    S = 1'b1; Cout = 1'b0;
  end
  010: begin
    S = 1'b1; Cout = 1'b0;
  end
  011: begin
    S = 1'b0; Cout = 1'b1;
  end
  100: begin
    S = 1'b1; Cout = 1'b0;
  end
  101: begin
    S = 1'b0; Cout = 1'b1;
  end
  110: begin
    S = 1'b0; Cout = 1'b1;
  end
  111: begin
    S = 1'b1; Cout = 1'b1;
  end
  default: begin
    S = 1'b0; Cout = 1'b0;
  end
  endcase
end
endmodule