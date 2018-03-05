//File: tb_ones_count.v

`timescale 1 ns / 1 ns

`include "ones_count.v"

module tb_ones_count;
  wire [3:0] count;
  reg [7:0] data_in;
  
  ones_count count1(.count(count), .data_in(data_in));
  
  initial
  begin
    data_in = 8'b0;
    forever #10 data_in = data_in + 8'b1;
  end
  
  initial
  begin
    $monitor("data_in=%b, count=%d", data_in, count);
  end
endmodule
