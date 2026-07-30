module FSM_Moore (
    input wire clk, rst,
    input wire x,
    output reg y
);

localparam S0 = 2'b00,
           S1 = 2'b01,
           S2 = 2'b10,
           S3 = 2'b11;

reg [1:0] state, next_state;

//next_state logic
always @(*) begin
  case(state)
  S0: next_state = x ? S0 : S1;
  S1: next_state = x ? S2 : S1;
  S2: next_state = x ? S3 : S1;
  S3: next_state = x ? S0 : S1;
  endcase
end

//state registers
always @(posedge clk or negedge rst) begin
  if(!rst) begin
    state <= S0;
  end
  else begin
    state <= next_state;
  end
end

//output logic
always @(*) begin
  case(state)
  S0, S1, S2: y = 1'b0;
  S3: y = 1'b1;
  endcase
end

endmodule