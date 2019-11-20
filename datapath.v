// Code modified from
// https://vlsicoding.blogspot.com/2014/07/verilog-code-for-4-bit-linear-feedback-shift-register.html
// number occurs about 1/128 cycles
module random (out, clock, reset);
  input clock, reset;
  output reg [6:0] out;


  wire feedback;
  reg result;

  assign feedback = ~(out[6] ^ out[5]);

	always @(posedge clock, negedge reset)
	begin
		if (~reset)
			out = 7'b0;
		else
			out = {out[5:0], feedback};
		
		result = (out == 7'b1010111) ? 1 : 0;
	end
endmodule

