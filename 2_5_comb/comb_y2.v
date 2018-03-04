//File: comb_y2.v

`timescale 1 ns / 1 ns

module comb_Y2(Y, A, B, C, D);
  output Y;
  input A, B, C, D;
  
  assign Y = (~A&B&~C&~D)|(~A&B&~C&D)|(~A&B&C&~D)|(~A&B&C&D)|(A&~B&C&D)|(A&B&~C&~D)|(A&B&~C&D);
endmodule
