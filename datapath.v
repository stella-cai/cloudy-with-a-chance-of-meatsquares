
module rate_divider(out_pulse, pulse_time, reset, clk);
	output out_pulse;
	input [29:0] pulse_time;
	input clk, reset;
	reg counter;
	wire [29:0] timer;
	always @(posedge clk)
		begin
			if (!reset)
				counter <= 30'd0;
			else if (counter == pulse_time)
				counter <= 30'd0;
			else
				counter <= counter + 30'd1;
		end
	assign out_pulse = (counter == 30'd0) ? 1'b1 : 1'b0;
endmodule

// Code modified from
// https://vlsicoding.blogspot.com/2014/07/verilog-code-for-4-bit-linear-feedback-shift-register.html
// number occurs about 1/7 cycles
module random (out, clock, reset);
  input clock, reset;
  output reg [3:0] out;


  wire feedback;
  reg result;

  assign feedback = ~(out[3] ^ out[2]);

	always @(posedge clock, negedge reset)
	begin
		if (~reset)
			out = 4'b0;
		else
			out = {out[2:0], feedback};
		
		result = (out == 4'b1011) ? 1 : 0;
	end
endmodule

module vertical_register(q, X, reset, clk);
	output reg [27:0] q;
	input [27:0] X;
	input reset, clk;
	always @(posedge clk)
		begin
			if (!reset)
				q <= 11'd0;
			else
				q <= X;
		end
endmodule

module update_register(register_value, x_value, clk, 
		VGA_CLK,   						//	VGA Clock
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_BLANK_N,						//	VGA BLANK
		VGA_SYNC_N,						//	VGA SYNC
		VGA_R,   						//	VGA Red[9:0]
		VGA_G,	 						//	VGA Green[9:0]
		VGA_B);   						//	VGA Blue[9:0]);
	input [7:0] x_value;
	input [27:0] register_value;
	input clk;
	
	output			VGA_CLK;   				//	VGA Clock
	output			VGA_HS;					//	VGA H_SYNC
	output			VGA_VS;					//	VGA V_SYNC
	output			VGA_BLANK_N;				//	VGA BLANK
	output			VGA_SYNC_N;				//	VGA SYNC
	output	[9:0]	VGA_R;   				//	VGA Red[9:0]
	output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
	output	[9:0]	VGA_B;
	
	initial
		begin
			reg [2:0] color;
			for (i = 0; i <= 13; i = i + 2)
				begin
					begin
						if (register_value[i + 1: i] == 2'b00)
							color <= 3'b011;
						else if (register_value[i + 1: i] == 2'b01)
							color <= 3'b010;
						else if (register_value[i + 1: i] == 2'b10)
							color <= 3'b100;
						else
							color <= 3'b011;
					end
					begin
						draw d0(x_value, 6'b001000 * i, color, 1'b1, 1'b1, clk,
						VGA_CLK,   						//	VGA Clock
						VGA_HS,							//	VGA H_SYNC
						VGA_VS,							//	VGA V_SYNC
						VGA_BLANK_N,						//	VGA BLANK
						VGA_SYNC_N,						//	VGA SYNC
						VGA_R,   						//	VGA Red[9:0]
						VGA_G,	 						//	VGA Green[9:0]
						VGA_B );
					end
				end
		end 
endmodule
