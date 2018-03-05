//File: dec_counter.v

`timescale 1 ns / 1 ns

module dec_counter(count, clk, reset);
  output reg [3:0] count;
  input clk;
  input reset;
  
  always @ (posedge clk)
  begin
    if(reset)count <= 4'b0;
    else begin
      if(count < 4'b1010)count <= count + 1;
      else count <= 4'b0;
      end
  end
endmodule
