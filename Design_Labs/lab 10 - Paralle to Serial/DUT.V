module DUT (
    input wire clk, rst, load, start,
    input wire [7:0] Parallel_in,
    output reg Serial_out,
    output wire done
);

reg [7:0] parallel_in;
reg [3:0] counter;

always @(posedge clk or negedge rst) begin
  if(!rst) begin
    parallel_in <= 8'd0;
    counter <= 4'd0;
  end
  else if(load) begin
    parallel_in <= Parallel_in;
    counter <= 4'b0;
  end
  else if(start && counter < 4'd8) begin
    Serial_out <= parallel_in[7 - counter];
    counter <= counter + 1;
  end
end

assign done = (counter  == 4'd8) ? 1'b1 : 1'b0;
endmodule 