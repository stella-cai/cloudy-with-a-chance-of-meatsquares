module random (out, clock, reset);
  input clock, reset;
  output reg [11:0] out;


  wire feedback;
  
  assign feedback = out[11] ^ out[10] ^ out[9] ^ out[3];

	always @(posedge clock, negedge reset)
	begin
		if (~reset)
			out <= 12'b111111111111;
		else
			out <= {out[10:0], feedback};
	end
endmodule