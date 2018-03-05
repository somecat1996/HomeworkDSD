//File: tb_LFSR.v

`timescale 1 ns / 1 ns

`include "LFSR.v"

module tb_LFSR;
  wire [26:1] q;
  reg [26:1] din;
  reg clk, load, rst_n;
  
  LFSR l1(.q(q), .clk(clk), .din(din), .load(load), .rst_n(rst_n));
  
  initial
  begin
    rst_n = 1'b0;
    #11 rst_n = 1'b1;
  end
  
  initial
  begin
    clk = 1'b0;
    forever #5 clk = ~clk;
  end
  
  initial
  begin
    load = 1'b0;
    din = 26'b0;
    #56 load = 1'b1;
    din = 26'b1001_1110_0010;
    #10 load = 1'b0;
  end
  
  initial
  begin
    $monitor("at time%4t, rst_n = %b, load = %b, din = %b, q = %b(%d)", $time, rst_n, load, din, q, q);
  end
endmodule
