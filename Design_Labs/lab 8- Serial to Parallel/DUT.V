module DUT (
    input wire clk, rst, en, Serial_in,
    output wire done,
    output reg [7:0] Parallel_out
);

reg [3:0] counter;

always @(posedge clk or negedge rst) begin
  if(!rst) begin
    Parallel_out <= 8'd0;
    counter <= 4'd0;
  end
  else if(en) begin
    Parallel_out <= {Parallel_out[6:0], Serial_in};
    if(counter < 4'd9)
        counter <= counter + 1;
    else 
        counter <= 4'd0;
  end
end

assign done = (counter == 4'd8);
endmodule