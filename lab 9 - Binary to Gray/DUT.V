module DUT (
    input wire clk, rst,
    output reg [3:0] count_gray
);

reg [3:0] count_binary;

always @(posedge clk or negedge rst) begin
  if(!rst) begin
    count_binary <= 4'd0;
    count_binary <= 4'd0;
  end
  else begin
    count_binary <= count_binary + 1;
    case(count_binary)
    4'b0000: count_gray <= 4'b0000;
    4'b0001: count_gray <= 4'b0001;
    4'b0010: count_gray <= 4'b0011;
    4'b0011: count_gray <= 4'b0010;
    4'b0100: count_gray <= 4'b0110;
    4'b0101: count_gray <= 4'b0111;
    4'b0110: count_gray <= 4'b0101;
    4'b0111: count_gray <= 4'b0100;
    4'b1000: count_gray <= 4'b1100;
    4'b1001: count_gray <= 4'b1101;
    4'b1010: count_gray <= 4'b1111;
    4'b1011: count_gray <= 4'b1110;
    4'b1100: count_gray <= 4'b1010;
    4'b1101: count_gray <= 4'b1011;
    4'b1110: count_gray <= 4'b1001;
    4'b1111: count_gray <= 4'b1000;
    endcase
  end
end
endmodule