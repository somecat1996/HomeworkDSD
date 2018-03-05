//File: tb_shift_counter.v

`timescale 1 ns / 1 ns

`include "shift_counter.v"

module tb_shift_counter;
  wire [7:0] count;
  reg clk, reset;
  
  shift_counter counter1(.count(count), .clk(clk), .reset(reset));
  
  initial
  begin
    clk = 1'b0;
    forever #5 clk = ~clk;
  end
  
  initial
  begin
    reset = 1'b1;
    #11 reset = 1'b0;
    #50 reset = 1'b1;
    #10 reset = 1'b0;
  end
  
  initial
  begin
    $monitor("At time %4t, reset = %b, count = %b", $time, reset, count);
  end
endmodule
