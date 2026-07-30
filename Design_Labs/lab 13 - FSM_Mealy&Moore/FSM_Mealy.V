module FSM_Mealy (
    input wire clk, rst,
    input wire x,
    output reg y
);

parameter S0 = 2'b00,
          S1 = 2'b01,
          S2 = 2'b10;

reg [1:0] state, next_state;

//next_state logic
always @(*) begin
  case(state)
  S0: next_state = x ? S0 : S1;
  S1: next_state = x ? S2 : S1;
  S2: next_state = x ? S0 : S1; 
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

//output mealy logic
always @(*) begin
  case(state)
  S0, S1: y = 1'b0;
  S2: y = x ? 1'b1 : 1'b0;
  endcase
end

endmodule