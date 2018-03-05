//File: mux.v

`timescale 1 ns / 1 ns

module mux(y, in, sel);
  output y;
  input [1:0] in;
  input sel;
  
  assign y = sel?in[1]:in[0];
endmodule
