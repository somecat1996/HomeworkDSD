//File: tb_encoder8x3.v

`timescale 1 ns / 1 ns

`include "encoder8x3.v"

module tb_encoder8x3;
  reg [7:0] data;
  wire [2:0] code;
  
  Encoder8x3 encoder(.code(code), .data(data));
  
  initial
  begin
    data = 8'b1;
    forever #10 data = data << 1;
  end
  
  initial
  begin
    $monitor("data=%b, code=%d", data, code);
  end
endmodule
