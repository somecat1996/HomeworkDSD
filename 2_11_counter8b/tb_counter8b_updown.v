//File tb_counter8b_updown.v

`timescale 1 ns / 1 ns

`include "counter8b_updown.v"

module tb_counter8b_updown;
  reg clk, reset, dir;
  wire [7:0] count;
  
  counter8b_updown counter(.count(count), .clk(clk), .reset(reset), .dir(dir));
  
  initial
  begin
    clk = 1'b0;
    forever #5 clk = ~clk;
  end
  
  initial
  begin
    reset = 1'b0;
    #11 reset = 1'b1;
    #50 reset = 1'b0;
    #50 reset = 1'b1;
  end
  
  initial
  begin
    dir = 1'b1;
    #110 dir = 1'b0;
    #100 dir = 1'b1;
  end
endmodule
