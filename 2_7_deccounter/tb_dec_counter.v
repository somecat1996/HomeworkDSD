//File: tb_dec_counter.v

`timescale 1 ns / 1 ns

`include "dec_counter.v"

module tb_dec_counter;
  reg clk, reset;
  wire [3:0] count;
  
  dec_counter counter(.count(count), .clk(clk), .reset(reset));
  
  initial
  begin
    clk = 1'b0;
    forever #5 clk = ~clk;
  end
  
  initial
  begin
    reset = 1'b1;
    #25 reset = 1'b0;
    #25 reset = 1'b1;
    #10 reset = 1'b0;
  end
  
  initial
  begin
    $monitor($time, "reset=%b, counter=%d", reset, count);
  end
endmodule
