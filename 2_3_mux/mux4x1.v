//File: mux4x1.v

`timescale 1 ns /1 ns

`include "mux2x1.v"

module mux4x1(dout, sel, din);
  output wire dout;
  input wire [1:0] sel;
  input wire [3:0] din;
  wire t1, t2;
  
  mux2x1 mux1(.dout(t1), .sel(sel[0]), .din(din[1:0])),
         mux2(.dout(t2), .sel(sel[0]), .din(din[3:2])),
         mux3(.dout(dout), .sel(sel[1]), .din({t2, t1}));
endmodule
