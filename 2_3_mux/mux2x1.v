//File: mux2x1.v

`timescale 1 ns /1 ns

module mux2x1(dout, sel, din);
  output wire dout;
  input wire sel;
  input wire [1:0] din;
  
  bufif0 b1(dout, din[0], sel);
  bufif1 b2(dout, din[1], sel);
endmodule
