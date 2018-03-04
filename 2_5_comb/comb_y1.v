//File: comb_y1.v

`timescale 1 ns / 1 ns

module comb_Y1(Y, A, B, C);
  output Y;
  input A, B, C;
  
  assign Y = (~A&~B&C)|(~A&B&~C)|(A&~B&~C)|(A&~B&C);
endmodule
