module Counter_FSM (
    input wire clk, rst,
    output reg [1:0] cnt
);

localparam S0 = 2'b00,
           S1 = 2'b01,
           S2 = 2'b10,
           S3 = 2'b11;

reg [1:0] state, next_state;

always @(*) begin
 case(state)
  S0: next_state = S1;
  S1: next_state = S2;
  S2: next_state = S3;
  S3: next_state = S0;
 endcase
end

always @(posedge clk or negedge rst) begin
  if(!rst) begin
    state <= S0;
  end
  else begin
    state <= next_state;
  end
end

always @(*) begin
  case(state)
   S0: cnt = 2'b00;
   S1: cnt = 2'b01;
   S2: cnt = 2'b10;
   S3: cnt = 2'b11;
   endcase
end

endmodule