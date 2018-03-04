//File: comb_dataflow.v

`timescale 1 ns / 1 ns

module comb_dataflow(Y, A, B, C, D);
  output wire Y;
  input wire A, B, C, D;
  
  assign Y  = (~(A|D))&(B&C&(~D));
endmodule
