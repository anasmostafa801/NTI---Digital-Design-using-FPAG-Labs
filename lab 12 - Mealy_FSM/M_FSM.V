module FSM (
    input wire clk, rst,
    input wire x,
    output reg y
);

parameter S0 = 1'b0,
          S1 = 1'b1;

reg state, next_state;

//next_state logic
always @(*) begin
  case(state)
  S0: next_state = x ? S1: S0;
  S1: next_state = S0;
  endcase
end

//state registers
always @(posedge clk or negedge rst) begin
  if(!rst) 
    state <= S0;
  else 
    state <= next_state;
end

//output logic
always @(*) begin
  case(state)
  S0: y = x ? 1'b1 : 1'b0;
  S1: y = 1'b0; 
  endcase
end
endmodule