//File: filter.v

`timescale 1 ns / 1 ns

module filter(sig_out, clock, reset, sig_in);
  output reg sig_out;
  input clock, reset, sig_in;
  reg [3:0] t;
  wire j, k;
  
  always @ (posedge clock)
  begin
    if(~reset)t = 4'b0;
    else t = {t[2:0], sig_in};
  end
  
  always @ (posedge clock)
  begin
    if(~reset)sig_out = 1'b0;
    else
      case({j, k})
        2'b00:;
        2'b01:sig_out = 1'b0;
        2'b10:sig_out = 1'b1;
        2'b11:sig_out = ~sig_out;
        default:sig_out = 1'bx;
      endcase
  end
  
  assign j = &t[3:1];
  assign k = &(~t[3:1]);
endmodule
    
