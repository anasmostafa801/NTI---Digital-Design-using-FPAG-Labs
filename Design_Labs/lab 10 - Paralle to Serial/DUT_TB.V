`timescale 1ns/1ps

module dut_tb;
reg clk = 0, rst = 1, load, start;
reg [7:0] Parallel_in;
wire Serial_out;
wire done;

DUT DUT (.clk(clk), .rst(rst), .load(load),
         .start(start), .Parallel_in(Parallel_in),
         .Serial_out(Serial_out), .done(done));

always #5 clk = ~clk;

initial begin
  #1 rst = 0;
  #9 rst = 1;
  repeat(20) begin
    Parallel_in = $random;
    load = 1;
    start = 1'b0;
    #10;
    load = 1'b0;
    start = 1'b1;
    #80;
  end
  $stop;
end
endmodule