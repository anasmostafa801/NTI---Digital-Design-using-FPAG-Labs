module Encoder (
    input wire [3:0] D,
    output reg [1:0] Q,
    output reg valid
);

always @(*) begin
    valid = 1'b1;
  case(D)
  0001: Q = 2'b00;
  0010: Q = 2'b01;
  0100: Q = 2'b10;
  1000: Q = 2'b11;
  default: begin 
    Q = 2'b00;
    valid = 1'b0;
  end
  endcase
end
endmodule