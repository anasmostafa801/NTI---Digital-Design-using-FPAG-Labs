`timescale 1ns/1ps

module dut_tb;
reg clk = 0, rst = 1, en;
reg Serial_in;
wire done;
wire [7:0] Parallel_out;

DUT DUT (.clk(clk), .rst(rst), .en(en),
         .Serial_in(Serial_in), .done(done),
         .Parallel_out(Parallel_out));

always #5 clk = ~clk;

initial begin
  #1 rst = 0;
  #9 rst = 1;
  repeat(30) begin
    #3;
    Serial_in = $random;
    en = $random;
    #7;
  end
  $stop;
end


endmodule