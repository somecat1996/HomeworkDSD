//File: shift_counter.v

`timescale 1 ns / 1 ns

module shift_counter(count, clk, reset);
  output reg [7:0] count;
  input clk, reset;
  reg dir;
  
  initial
  begin
    count <= 8'b1;
  end
  
  always @ (clk)
  begin
    if(reset)
      begin
        count <= 8'b1;
      end
    else
      begin
        if(dir)count <= count << 1;
        else count <= count >> 1;
      end
  end
  
  always @ (posedge count[0])
  begin
    dir <= 1'b1;
  end
  
  always @ (posedge count[7])
  begin
    dir <= 1'b0;
  end
endmodule
        
