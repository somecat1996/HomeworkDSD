//File: tb_mux4x1.v

`timescale 1 ns / 1 ns

`include "mux4x1.v"

module tb_mux4x1;
  reg [1:0]sel;
  reg [3:0] din;
  wire dout;
  
  mux4x1 mux2(.dout(dout), .sel(sel), .din(din));
  
  initial
  begin
    sel = 2'b0;
    forever #80 sel = sel + 2'b1;
  end
  
  initial
  begin
    din = 4'b0;
    forever #5 din = din + 4'b1;
  end
  
  initial
  begin
    $monitor("in=%b, s=%b, out=%b", din, sel, dout);
  end
endmodule
