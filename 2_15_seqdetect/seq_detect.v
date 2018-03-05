//File: seq_detect.v

`timescale 1 ns / 1 ns

module seq_detect(flag, din, clk, rst_n);
  output reg flag;
  input din, clk, rst_n;
  parameter IDLE = 7'b000_0001, A = 7'b000_0010, B = 7'b000_0100,
               C = 7'b000_1000, D = 7'b001_0000, E = 7'b010_0000,
               F = 7'b100_0000;
  reg [6:0] state;
  
  always @ (negedge clk)
  begin
    if(!rst_n)begin state <= IDLE; flag <= 1'b0; end
    else
      case(state)
        IDLE: if(din)begin state <= D; flag <= 1'b0; end
              else begin state <= A; flag <= 1'b0; end
        A:    if(din)begin state <= B; flag <= 1'b0; end
              else begin state <= A; flag <= 1'b0; end
        B:    if(din)begin state <= C; flag <= 1'b0; end
              else begin state <= A; flag <= 1'b0; end
        C:    if(din)begin state <= E; flag <= 1'b0; end
              else begin state <= F; flag <= 1'b1; end
        D:    if(din)begin state <= E; flag <= 1'b0; end
              else begin state <= A; flag <= 1'b0; end
        E:    if(din)begin state <= E; flag <= 1'b0; end
              else begin state <= F; flag <= 1'b0; end
        F:    if(din)begin state <= B; flag <= 1'b1; end
              else begin state <= A; flag <= 1'b0; end
        default:begin state <= IDLE; flag <= 1'b0; end
      endcase
  end
endmodule
