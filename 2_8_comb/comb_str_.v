//File: comb_str.v

`timescale 1 ns / 1 ns

`include "mux.v"

module comb_str(y, sel, A, B, C, D);
  output y;
  input sel, A, B, C, D;
  wire [1:0] t;
  
  mux mux1(.y(y), .sel(sel), .in(t));
  nand #(3) nand1(t[0], A, B);
  nand #(4) nand2(t[1], C, D);
endmodule
