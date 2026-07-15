module ALU (
    input wire [4:0] Operand1, Operand2,
    input wire [3:0] OPCODE,
    output reg shift_flag, arith_flag,
    output reg cmp_flag, logic_flag,
    output reg [4:0] Result
);

always @(*) begin
    arith_flag = 0;
    logic_flag = 0;
    shift_flag = 0;
    cmp_flag = 0;
  case(OPCODE)
  0000: begin
    Result = Operand1 + Operand2;
    arith_flag = 1;
  end
  0001: begin
    Result = Operand1 - Operand2;
    arith_flag = 1;
  end
  0010: begin
    Result = Operand1 * Operand2;
    arith_flag = 1;
  end
  0011: begin
    Result = Operand1 / Operand2;
    arith_flag = 1;
  end
  0100: begin
    Result = Operand1 & Operand2;
    logic_flag = 1;
  end
  0101: begin
    Result = Operand1 | Operand2;
    logic_flag = 1;
  end
  0110: begin
    Result = ~(Operand1 & Operand2);
    logic_flag = 1;
  end
  0111: begin
    Result = ~(Operand1 | Operand2);
    logic_flag = 1;
  end
  1000: begin
    Result = Operand1 ^ Operand2;
    logic_flag = 1;
  end
  1001: begin
    Result = ~(Operand1 ^ Operand2);
    logic_flag = 1;
  end
  1010: begin
    Result = (Operand1 == Operand2);
    cmp_flag = 1;
  end
  1011: begin
    Result = (Operand1 > Operand2) ? 'd2 : 'd0;
    cmp_flag = 1;
  end
  1100: begin
    Result = (Operand1 < Operand2) ? 'd3 : 'd0;
    cmp_flag = 1;
  end
  1101: begin
    Result = Operand1 >> 1;
    shift_flag = 1;
  end
  1110: begin
    Result = Operand1 << 1;
    shift_flag = 1;
  end
  default : Result  = 'd0;
  endcase
end
endmodule