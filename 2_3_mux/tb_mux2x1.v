//File: tb_mux2x1.v

`timescale 1 ns / 1 ns

`include "mux2x1.v"

module tb_mux2x1;
  reg sel;
  reg [1:0] din;
  wire dout;
  
  mux2x1 mux2(.dout(dout), .sel(sel), .din(din));
  
  initial
  begin
    sel = 1'b0;
    forever #40 sel = ~sel;
  end
  
  initial
  begin
    din = 2'b0;
    forever #10 din = din + 2'b1;
  end
  
  initial
  begin
    $monitor("in=%b, s=%b, out=%b", din, sel, dout);
  end
endmodule
