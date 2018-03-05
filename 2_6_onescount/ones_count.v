//File: ones_count.v

`timescale 1 ns / 1 ns

module ones_count(count, data_in);
  output [3:0] count;
  input [7:0] data_in;
  
  assign count = data_in[7]+data_in[6]+data_in[5]+data_in[4]+data_in[3]+data_in[2]+data_in[1]+data_in[0];
endmodule
