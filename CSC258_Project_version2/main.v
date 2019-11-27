module main(VGA_CLK,   						//	VGA Clock
			VGA_HS,							//	VGA H_SYNC
			VGA_VS,							//	VGA V_SYNC
			VGA_BLANK_N,						//	VGA BLANK
			VGA_SYNC_N,						//	VGA SYNC
			VGA_R,   						//	VGA Red[9:0]
			VGA_G,	 						//	VGA Green[9:0]
			VGA_B,   						//	VGA Blue[9:0]
			PS2_CLK,
			PS2_DAT,
			SW, KEY, CLOCK_50);
		output			VGA_CLK;   				//	VGA Clock
		output			VGA_HS;					//	VGA H_SYNC
		output			VGA_VS;					//	VGA V_SYNC
		output			VGA_BLANK_N;				//	VGA BLANK
		output			VGA_SYNC_N;				//	VGA SYNC
		output	[9:0]	VGA_R;   				//	VGA Red[9:0]
		output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
		output	[9:0]	VGA_B;   				//	VGA Blue[9:0]
		
		input [9:0] SW;
		input [3:0] KEY;
		input CLOCK_50;
		input PS2_CLK, PS2_DAT;
		
		wire W,A,S,D,left, right, top, down, space, enter;
		keyboard_tracker keyboard0#(parameter PULSE_OR_HOLD = 1)(CLOCK_50, resetn, PS2_CLK, PS2_DAT, W,A,S,D,left, right, top, down, space, enter);
		
		
		wire falling_rate;
		wire appearing_rate;
		wire refresh_rate;
		wire refresh_rate2;
		rate_divider r0(falling_rate, 30'd892857, resetn, CLOCK_50);
		rate_divider r1(appearing_rate, 30'd10999999, resetn, CLOCK_50);
		rate_divider r2(refresh_rate, 30'd1000, resetn, CLOCK_50);
		rate_divider r3(refresh_rate2, 30'd16, resetn, CLOCK_50);
		
		wire resetn, go;
		assign resetn = SW[0];
		assign go = SW[1];
		
		reg [57:0] v1;
		reg [57:0] v2;
		reg [57:0] v3;
		reg [57:0] v4;
		reg [57:0] v5;
		reg [57:0] v6;
		reg [57:0] v7;
		reg [57:0] v8;
		reg [57:0] v9;
		reg [57:0] v10;
		reg [57:0] v11;
		reg [57:0] v12;
		reg [57:0] v13;
		reg [57:0] v14;
		reg [57:0] v15;
		reg [57:0] v16;
		reg [57:0] v17;
		reg [57:0] v18;
		reg [57:0] v19;
		reg [57:0] v20;
		reg [57:0] v21;
		reg [57:0] v22;
		reg [57:0] v23;
		reg [57:0] v24;
		reg [57:0] v25;
		reg [57:0] v26;
		reg [57:0] v27;
		reg [57:0] v28;
		reg [57:0] v29;
		reg [57:0] v30;
		reg [29:0] horizontal;
		always @(posedge CLOCK_50) begin
			if (!resetn)
				begin
					v1 <= 58'd0;
					v2 <= 58'd0;
					v3 <= 58'd0;
					v4 <= 58'd0;
					v5 <= 58'd0;
					v6 <= 58'd0;
					v7 <= 58'd0;
					v8 <= 58'd0;
					v9 <= 58'd0;
					v10 <= 58'd0;
					v11 <= 58'd0;
					v12 <= 58'd0;
					v13 <= 58'd0;
					v14 <= 58'd0;
					v15 <= 58'd0;
					v16 <= 58'd0;
					v17 <= 58'd0;
					v18 <= 58'd0;
					v19 <= 58'd0;
					v20 <= 58'd0;
					v21 <= 58'd0;
					v22 <= 58'd0;
					v23 <= 58'd0;
					v24 <= 58'd0;
					v25 <= 58'd0;
					v26 <= 58'd0;
					v27 <= 58'd0;
					v28 <= 58'd0;
					v29 <= 58'd0;
					v30 <= 58'd0;
					horizontal <= 30'd1;
				end
			else
				begin
					v1 <= v1;
					v2 <= v2;
					v3 <= v3;
					v4 <= v4;
					v5 <= v5;
					v6 <= v6;
					v7 <= v7;
					v8 <= v8;
					v9 <= v9;
					v10 <= v10;
					v11 <= v11;
					v12 <= v12;
					v13 <= v13;
					v14 <= v14;
					v15 <= v15;
					v16 <= v16;
					v17 <= v17;
					v18 <= v18;
					v19 <= v19;
					v20 <= v20;
					v21 <= v21;
					v22 <= v22;
					v23 <= v23;
					v24 <= v24;
					v25 <= v25;
					v26 <= v26;
					v27 <= v27;
					v28 <= v28;
					v29 <= v29;
					v30 <= v30;
					horizontal <= horizontal;
				end
			end
		always @(posedge falling_rate)
			begin
				v1 <= v1  << 2'd2;
				v2 <= v2 << 2'd2;
				v3 <= v3 << 2'd2;
				v4 <= v4 << 2'd2;
				v5 <= v5 << 2'd2;
				v6 <= v6 << 2'd2;
				v7 <= v7 << 2'd2;
				v8 <= v8 << 2'd2;
				v9 <= v9 << 2'd2;
				v10 <= v10 << 2'd2;
				v11 <= v11 << 2'd2;
				v12 <= v12 << 2'd2;
				v13 <= v13 << 2'd2;
				v14 <= v14 << 2'd2;
				v15 <= v15 << 2'd2;
				v16 <= v16 << 2'd2;
				v17 <= v17 << 2'd2;
				v18 <= v18 << 2'd2;
				v19 <= v19 << 2'd2;
				v20 <= v20 << 2'd2;
				v21 <= v21 << 2'd2;
				v22 <= v22 << 2'd2;
				v23 <= v23 << 2'd2;
				v24 <= v24 << 2'd2;
				v25 <= v25 << 2'd2;
				v26 <= v26 << 2'd2;
				v27 <= v27 << 2'd2;
				v28 <= v28 << 2'd2;
				v29 <= v29 << 2'd2;
				v30 <= v30 << 2'd2;
			end
		
		wire [4:0] reg_address, bit_val;
		random ran0(reg_address, CLOCK_50, resetn);
		random ran0(bit_val, CLOCK_50, resetn);
		always @(posedge appearing_rate)
			begin
				case(reg_address)
					5'0:v1[1:0] = bit_val[1:0];
					5'1:v2[1:0] = bit_val[1:0];
					5'2:v3[1:0] = bit_val[1:0];
					5'3:v4[1:0] = bit_val[1:0];
					5'4:v5[1:0] = bit_val[1:0];
					5'5:v6[1:0] = bit_val[1:0];
					5'6:v7[1:0] = bit_val[1:0];
					5'7:v8[1:0] = bit_val[1:0];
					5'8:v9[1:0] = bit_val[1:0];
					5'9:v10[1:0] = bit_val[1:0];
					5'10:v11[1:0] = bit_val[1:0];
					5'11:v12[1:0] = bit_val[1:0];
					5'12:v13[1:0] = bit_val[1:0];
					5'13:v14[1:0] = bit_val[1:0];
					5'14:v15[1:0] = bit_val[1:0];
					5'15:v16[1:0] = bit_val[1:0];
					5'16:v17[1:0] = bit_val[1:0];
					5'17:v18[1:0] = bit_val[1:0];
					5'18:v19[1:0] = bit_val[1:0];
					5'19:v20[1:0] = bit_val[1:0];
					5'20:v21[1:0] = bit_val[1:0];
					5'21:v22[1:0] = bit_val[1:0];
					5'22:v23[1:0] = bit_val[1:0];
					5'23:v24[1:0] = bit_val[1:0];
					5'24:v25[1:0] = bit_val[1:0];
					5'25:v26[1:0] = bit_val[1:0];
					5'26:v27[1:0] = bit_val[1:0];
					5'27:v28[1:0] = bit_val[1:0];
					5'28:v29[1:0] = bit_val[1:0];
					5'29:v30[1:0] = bit_val[1:0];
					default: v13[1:0] = bit_val[1:0];
			end
		
		always @(posedge CLOCK_50) begin
			if (horizontal == 30'd1 & right == 1'b1)
				horizontal <= horizontal;
			else if (horizontal == 30'd536870912 & left == 1'b1)
				horizontal <= horizontal;
			else if (left == 1'b1)
				horizontal <= horizontal << 1;
			else if (right == 1'b1)
				horizontal <= horizontal >> 1;
			else
				horizontal <= horizontal;
			end
		
		reg [4:0] reg_counter;
		reg [57:0] current_vertical_reg;
		always @(posedge refresh_rate) begin
			if (!resetn)
				reg_counter <= 5'd0;
			else if (reg_counter == 5'd29)
				reg_counter <= 5'd0;
			else
				reg_counter <= reg_counter + 5'd1;
			end
		always @(posedge refresh_rate)
			begin
				case(reg_address)
					5'0:current_vertical_reg = v1;
					5'1:current_vertical_reg = v2;
					5'2:current_vertical_reg = v3;
					5'3:current_vertical_reg = v4;
					5'4:current_vertical_reg = v5;
					5'5:current_vertical_reg = v6;
					5'6:current_vertical_reg = v7;
					5'7:current_vertical_reg = v8;
					5'8:current_vertical_reg = v9;
					5'9:current_vertical_reg = v10;
					5'10:current_vertical_reg = v11;
					5'11:current_vertical_reg = v12;
					5'12:current_vertical_reg = v13;
					5'13:current_vertical_reg = v14;
					5'14:current_vertical_reg = v15;
					5'15:current_vertical_reg = v16;
					5'16:current_vertical_reg = v17;
					5'17:current_vertical_reg = v18;
					5'18:current_vertical_reg = v19;
					5'19:current_vertical_reg = v20;
					5'20:current_vertical_reg = v21;
					5'21:current_vertical_reg = v22;
					5'22:current_vertical_reg = v23;
					5'23:current_vertical_reg = v24;
					5'24:current_vertical_reg = v25;
					5'25:current_vertical_reg = v26;
					5'26:current_vertical_reg = v27;
					5'27:current_vertical_reg = v28;
					5'28:current_vertical_reg = v29;
					5'29:current_vertical_reg = v30;
					default: current_vertical_reg = v1;;
			end
		wire [7:0] mid_x;
		wire [6:0] mid_y;
		wire [2:0] mid_colour;
		wire [7:0] mid_x2;
		wire [6:0] mid_y2;
		wire [2:0] mid_colour2;
		reg [7:0] X;
		reg [6:0] Y;
		reg [2:0] colour;
		verticle_register_update vertical0(mid_x, mid_y, mid_colour, current_vertical_reg, reg_counter * 4, resetn, refresh_rate2);
		horizontal_register_update horizontal0(mid_x2, mid_y2, mid_colour2, horizontal, resetn, refresh_rate2);
		always @(posedge refresh_rate)
			begin
				X <= mid_x;
				Y <= mid_y;
				colour <= mid_colour;
			end
		always @(negedge refresh_rate)
			begin
				X <= mid_x2;
				Y <= mid_y2;
				colour <= mid_colour2;
			end
		draw vga0(X, Y, colour, go, resetn, CLOCK_50,
					// The ports below are for the VGA output.  Do not change.
					VGA_CLK,   						//	VGA Clock
					VGA_HS,							//	VGA H_SYNC
					VGA_VS,							//	VGA V_SYNC
					VGA_BLANK_N,						//	VGA BLANK
					VGA_SYNC_N,						//	VGA SYNC
					VGA_R,   						//	VGA Red[9:0]
					VGA_G,	 						//	VGA Green[9:0]
					VGA_B   						//	VGA Blue[9:0]
					);
endmodule

module verticle_register_update(out_X, out_Y, out_colour, inReg, inX, resetn, clk);
	input [57:0] inReg;
	input [7:0] inX;
	input resetn, clk;
	output [7:0] out_X;
	output [6:0] out_Y;
	output [2:0] out_colour;
	
	reg [4:0]counter;
	always @(posedge clk) begin
		if (!resetn)
			counter <= 5'd0;
		else if (counter == 5'd28)
			counter <= 5'd0;
		else
			counter <= counter + 5'd1;
		end
	vertical_2bit_update v0(out_X, out_Y, out_colour, inReg[2 * counter + 1: 2 * counter], inX, 4 * counter, resetn, clk);
endmodule

module vertical_2bit_update(out_X, out_Y, out_colour, in, inX, inY, resetn, clk);
	input [1:0] in;
	input resetn, clk;
	input [7:0] inX;
	input [6:0] inY;
	output reg [7:0] out_X;
	output reg [6:0] out_Y;
	output reg [2:0] out_colour;
	
	reg [2:0] colour;
	
	always @(posedge clk) begin
		if (!resetn)
			colour <= 3'd0;
		else if (in == 2'b00)
			colour <= 3'd3;
		else if (in == 2'b10)
			colour <= 3'd2;
		else if (in == 2'b11 | in == 2'b01)
			colour <= 3'd4;
		else
			colour <= 3'd3;
		end
	
	always @(posedge clk) begin
		if (!resetn)
			begin
				out_X <= 8'd0;
				out_Y <= 7'd0;
				out_colour <= 3'd0;
			end
		else
			begin
				out_X <= inX;
				out_Y <= inY;
				out_colour <= colour;
			end
		end
endmodule

module horizontal_register_update(out_X, out_Y, out_colour, inReg, resetn, clk);
	input [29:0] inReg;
	input resetn, clk;
	output [7:0] out_X;
	output [6:0] out_Y;
	output [2:0] out_colour;
	
	reg [4:0]counter;
	always @(posedge clk) begin
		if (!resetn)
			counter <= 5'd0;
		else if (counter == 5'd29)
			counter <= 5'd0;
		else
			counter <= counter + 5'd1;
		end
	horizontal_1bit_update h0(out_X, out_Y, out_colour, inReg[counter], 4 * counter, 7'd115, resetn, clk);
endmodule

module horizontal_1bit_update(out_X, out_Y, out_colour, in, inX, inY, resetn, clk);
	input in;
	input resetn, clk;
	input [7:0] inX;
	input [6:0] inY;
	output reg [7:0] out_X;
	output reg [6:0] out_Y;
	output reg [2:0] out_colour;
	
	reg [2:0] colour;
	
	always @(posedge clk) begin
		if (!resetn)
			colour <= 3'd0;
		else if (in == 1'b0)
			colour <= 3'd5;
		else if (in == 1'b1)
			colour <= 3'd6;
		else
			colour <= 3'd5;
		end
	
	always @(posedge clk) begin
		if (!resetn)
			begin
				out_X <= 8'd0;
				out_Y <= 7'd0;
				out_colour <= 3'd0;
			end
		else
			begin
				out_X <= inX;
				out_Y <= inY;
				out_colour <= colour;
			end
		end
endmodule
	