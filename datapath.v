
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
	assign out_pulse = (counter == 30'd0) ? 1b'1 : 1'b0;
endmodule

module random(register_num, bit_val);
	output [3:0] register_num;
	output [1:0] bit_val;
	initial
		begin
			register_num = $urandom%15;
			bit_val = $urandom%2;
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
		VGA_B   						//	VGA Blue[9:0]);
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
			for (i = 0; i <= 13; i = i + 2)
				begin
					if (register_value[i + 1: i] == 2'b00)
						draw d0(x_value, 6'b001000 * i, 3'b011, 1'b1, 1'b1, clk, 
						VGA_CLK,   						//	VGA Clock
						VGA_HS,							//	VGA H_SYNC
						VGA_VS,							//	VGA V_SYNC
						VGA_BLANK_N,						//	VGA BLANK
						VGA_SYNC_N,						//	VGA SYNC
						VGA_R,   						//	VGA Red[9:0]
						VGA_G,	 						//	VGA Green[9:0]
						VGA_B   						//	VGA Blue[9:0]);
					else if (register_value[i + 1: i] == 2'b01)
						draw d1(x_value, 6'b001000 * i, 3'b010, 1'b1, 1'b1, clk,
						VGA_CLK,   						//	VGA Clock
						VGA_HS,							//	VGA H_SYNC
						VGA_VS,							//	VGA V_SYNC
						VGA_BLANK_N,						//	VGA BLANK
						VGA_SYNC_N,						//	VGA SYNC
						VGA_R,   						//	VGA Red[9:0]
						VGA_G,	 						//	VGA Green[9:0]
						VGA_B );
					else if (register_value[i + 1: i] == 2'b10)
						draw d1(x_value, 6'b001000 * i, 3'b100, 1'b1, 1'b1, clk,
						VGA_CLK,   						//	VGA Clock
						VGA_HS,							//	VGA H_SYNC
						VGA_VS,							//	VGA V_SYNC
						VGA_BLANK_N,						//	VGA BLANK
						VGA_SYNC_N,						//	VGA SYNC
						VGA_R,   						//	VGA Red[9:0]
						VGA_G,	 						//	VGA Green[9:0]
						VGA_B );
					else
						draw d0(x_value, 6'b001000 * i, 3'b011, 1'b1, 1'b1, clk,
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
endmodule
