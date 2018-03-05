//File tb_filter.v

`timescale 1 ns / 1 ns

`include "filter.v"

module tb_filter;
  wire sig_out;
  reg sig_in, clock, reset;
  
  filter f1(.sig_out(sig_out), .clock(clock), .reset(reset), .sig_in(sig_in));
  
  initial
  begin
    clock = 1'b0;
    forever #5 clock = ~clock;
  end
  
  initial
  begin
    #1 sig_in = 1'b0;
    forever #5 sig_in = $random % 2;
  end
  
  initial
  begin
    reset = 1'b0;
    #11 reset = 1'b1;
    #50 reset = 1'b0;
    #50 reset = 1'b1;
  end
endmodule
