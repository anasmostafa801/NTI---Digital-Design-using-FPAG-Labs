module DUT (
    input wire clk, rst, en, Serial_in,
    output wire done,
    output reg [7:0] Parallel_out
);

reg [2:0] counter;

always @(posedge clk or negedge rst) begin
  if(!rst) begin
    Parallel_out <= 8'd0;
    counter <= 3'd0;
  end
  else if(en) begin
    Parallel_out <= {Parallel_out[6:0], Serial_in};
    counter <= counter + 1;
  end
end

assign done = (counter == 3'7);
endmodule