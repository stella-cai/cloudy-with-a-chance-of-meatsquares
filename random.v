module random (out, clock, reset);
  input clock, reset;
  output reg [3:0] out;


  wire feedback;
  reg result;

  assign feedback = out[3] ^ out[2];

	always @(posedge clock, negedge reset)
	begin
		if (~reset)
			out = 4'b1111;
		else
			out = {out[2:0], feedback};
		
		result = (out == 4'b0100) ? 1 : 0;
	end
endmodule
