module DUT (
    input wire clk, rst, load, start,
    input wire [7:0] Parallel_in,
    output reg Serial_out,
    output wire done
);

reg [7:0] parallel_in;
reg [2:0] counter;

always @(posedge clk or negedge rst) begin
  if(!rst) begin
    parallel_in <= 8'd0;
    counter <= 3'd0;
  end
  else if(load) begin
    parallel_in <= Parallel_in;
  end
  else if(start) begin
    Serial_out <= parallel_in[7 - counter];
    counter <= counter + 1;
  end
end

assign done = (counter == 3'd7) ? 1'b1 : 1'b0;
endmodule 