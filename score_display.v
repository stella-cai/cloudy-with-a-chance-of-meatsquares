module score(input clock, input reset, input update, input draw,
					input [59:0] ground, input[8:0] mouse_position,
					output [7:0] x, output [6:0] y, output [2:0] color,
					output finish_drawing, output reg finish_game);
	
	reg [6:0] score_keeper;
	reg [3:0] lives;
	wire [1:0] has_caught_good, has_caught_bad;
	has_caught_good_square h0(has_caught_good, ground, mouse_position, clock);
	has_caught_bad_square bad0(has_caught_bad, ground, mouse_position, clock);
	always @(posedge clock)
		if (!reset)
			score_keeper <= 7'd0;
		else
			score_keeper <= score_keeper + has_caught_good;
	always @(posedge clock)
		if (!reset)
			lives = 4'd3;
		else begin
			lives = lives - has_caught_bad;
			finish_game = (lives == 0) ? 1 : 0;
		end
	wire [59:0] map_score;
	wire [29:0] lives_map;
	decimal_decoder dd0(map_score, score_keeper, clock, reset);

	single_decimal_decoder dd1(.map(map_lives), .lives(lives), .clock(clock), .resetn(reset));

	draw_score drawer(.clock(clock), .reset(reset), .draw(draw), .input_x(8'd125), .input_x2(8'd150), .input_y(7'd20), 
						.map(map_score), .lives_map(lives_map),
						.x(x), .y(y), .color(color), .finish_drawing(finish_drawing));

endmodule

module has_caught_good_square(output reg [1:0] caught, input [59:0] ground, input [8:0] mouse_position, input clk);
	always @(posedge clk) begin
		if (7'd0 <= mouse_position && mouse_position < 7'd4)
			caught <= (ground[59:58] == 2'b10) + (ground[57:56] == 2'b10);
		else if (7'd4 <= mouse_position && mouse_position < 7'd8)
			caught <= (ground[59:58] == 2'b10) + (ground[57:56] == 2'b10) + (ground[55:54] == 2'b10);
		else if (7'd8 <= mouse_position && mouse_position < 7'd12)
			caught <= (ground[57:56] == 2'b10) + (ground[55:54] == 2'b10) + (ground[53:52] == 2'b10);
		else if (7'd12 <= mouse_position && mouse_position < 7'd16)
			caught <= (ground[55:54] == 2'b10) + (ground[53:52] == 2'b10) + (ground[51:50] == 2'b10);
		else if (7'd16 <= mouse_position && mouse_position < 7'd20)
			caught <= (ground[53:52] == 2'b10) + (ground[51:50] == 2'b10) + (ground[49:48] == 2'b10);
		else if (7'd20 <= mouse_position && mouse_position < 7'd24)
			caught <= (ground[51:50] == 2'b10) + (ground[49:48] == 2'b10) + (ground[47:46] == 2'b10);
		else if (7'd24 <= mouse_position && mouse_position < 7'd28)
			caught <= (ground[49:48] == 2'b10) + (ground[47:46] == 2'b10) + (ground[45:44] == 2'b10);
		else if (7'd28 <= mouse_position && mouse_position < 7'd32)
			caught <= (ground[47:46] == 2'b10) + (ground[45:44] == 2'b10) + (ground[43:42] == 2'b10);
		else if (7'd32 <= mouse_position && mouse_position < 7'd36)
			caught <= (ground[45:44] == 2'b10) + (ground[43:42] == 2'b10) + (ground[41:40] == 2'b10);
		else if (7'd36 <= mouse_position && mouse_position < 7'd40)
			caught <= (ground[43:42] == 2'b10) + (ground[41:40] == 2'b10) + (ground[39:38] == 2'b10);
		else if (7'd40 <= mouse_position && mouse_position < 7'd44)
			caught <= (ground[41:40] == 2'b10) + (ground[39:38] == 2'b10) + (ground[37:36] == 2'b10);
		else if (7'd44 <= mouse_position && mouse_position < 7'd48)
			caught <= (ground[39:38] == 2'b10) + (ground[37:36] == 2'b10) + (ground[35:34] == 2'b10);
		else if (7'd48 <= mouse_position && mouse_position < 7'd52)
			caught <= (ground[37:36] == 2'b10) + (ground[35:34] == 2'b10) + (ground[33:32] == 2'b10);
		else if (7'd52 <= mouse_position && mouse_position < 7'd56)
			caught <= (ground[35:34] == 2'b10) + (ground[33:32] == 2'b10) + (ground[31:30] == 2'b10);
		else if (7'd56 <= mouse_position && mouse_position < 7'd60)
			caught <= (ground[33:32] == 2'b10) + (ground[31:30] == 2'b10) + (ground[29:28] == 2'b10);
		else if (7'd60 <= mouse_position && mouse_position < 7'd64)
			caught <= (ground[31:30] == 2'b10) + (ground[29:28] == 2'b10) + (ground[27:26] == 2'b10);
		else if (7'd64 <= mouse_position && mouse_position < 7'd68)
			caught <= (ground[29:28] == 2'b10) + (ground[27:26] == 2'b10) + (ground[25:24] == 2'b10);
		else if (7'd68 <= mouse_position && mouse_position < 7'd72)
			caught <= (ground[27:26] == 2'b10) + (ground[25:24] == 2'b10) + (ground[23:22] == 2'b10);
		else if (7'd72 <= mouse_position && mouse_position < 7'd76)
			caught <= (ground[25:24] == 2'b10) + (ground[23:22] == 2'b10) + (ground[21:20] == 2'b10);
		else if (7'd76 <= mouse_position && mouse_position < 7'd80)
			caught <= (ground[23:22] == 2'b10) + (ground[21:20] == 2'b10) + (ground[19:18] == 2'b10);
		else if (7'd80 <= mouse_position && mouse_position < 7'd84)
			caught <= (ground[21:20] == 2'b10) + (ground[19:18] == 2'b10) + (ground[17:16] == 2'b10);
		else if (7'd84 <= mouse_position && mouse_position < 7'd88)
			caught <= (ground[19:18] == 2'b10) + (ground[17:16] == 2'b10) + (ground[15:14] == 2'b10);
		else if (7'd88 <= mouse_position && mouse_position < 7'd92)
			caught <= (ground[17:16] == 2'b10) + (ground[15:14] == 2'b10) + (ground[13:12] == 2'b10);
		else if (7'd92 <= mouse_position && mouse_position < 7'd96)
			caught <= (ground[15:14] == 2'b10) + (ground[13:12] == 2'b10) + (ground[11:10] == 2'b10);
		else if (7'd96 <= mouse_position && mouse_position < 7'd100)
			caught <= (ground[13:12] == 2'b10) + (ground[11:10] == 2'b10) + (ground[9:8] == 2'b10);
		else if (7'd100 <= mouse_position && mouse_position < 7'd104)
			caught <= (ground[11:10] == 2'b10) + (ground[9:8] == 2'b10) + (ground[7:6] == 2'b10);
		else if (7'd104 <= mouse_position && mouse_position < 7'd108)
			caught <= (ground[9:8] == 2'b10) + (ground[7:6] == 2'b10) + (ground[5:4] == 2'b10);
		else if (7'd108 <= mouse_position && mouse_position < 7'd112)
			caught <= (ground[7:6] == 2'b10) + (ground[5:4] == 2'b10) + (ground[3:2] == 2'b10);
		else if (7'd112 <= mouse_position && mouse_position < 7'd116)
			caught <= (ground[5:4] == 2'b10) + (ground[3:2] == 2'b10) + (ground[1:0] == 2'b10);
		else if (7'd116 <= mouse_position && mouse_position < 7'd120)
			caught <= (ground[3:2] == 2'b10) + (ground[1:0] == 2'b10);
	end
endmodule

module has_caught_bad_square(output reg [1:0] caught, input [59:0] ground, input [8:0] mouse_position, input clk);
	always @(posedge clk) begin
			if (7'd0 <= mouse_position && mouse_position < 7'd4)
				caught <= (ground[59:58] == 2'b11) + (ground[57:56] == 2'b11);
			else if (7'd4 <= mouse_position && mouse_position < 7'd8)
				caught <= (ground[59:58] == 2'b11) + (ground[57:56] == 2'b11) + (ground[55:54] == 2'b11);
			else if (7'd8 <= mouse_position && mouse_position < 7'd12)
				caught <= (ground[57:56] == 2'b11) + (ground[55:54] == 2'b11) + (ground[53:52] == 2'b11);
			else if (7'd12 <= mouse_position && mouse_position < 7'd16)
				caught <= (ground[55:54] == 2'b11) + (ground[53:52] == 2'b11) + (ground[51:50] == 2'b11);
			else if (7'd16 <= mouse_position && mouse_position < 7'd20)
				caught <= (ground[53:52] == 2'b11) + (ground[51:50] == 2'b11) + (ground[49:48] == 2'b11);
			else if (7'd20 <= mouse_position && mouse_position < 7'd24)
				caught <= (ground[51:50] == 2'b11) + (ground[49:48] == 2'b11) + (ground[47:46] == 2'b11);
			else if (7'd24 <= mouse_position && mouse_position < 7'd28)
				caught <= (ground[49:48] == 2'b11) + (ground[47:46] == 2'b11) + (ground[45:44] == 2'b11);
			else if (7'd28 <= mouse_position && mouse_position < 7'd32)
				caught <= (ground[47:46] == 2'b11) + (ground[45:44] == 2'b11) + (ground[43:42] == 2'b11);
			else if (7'd32 <= mouse_position && mouse_position < 7'd36)
				caught <= (ground[45:44] == 2'b11) + (ground[43:42] == 2'b11) + (ground[41:40] == 2'b11);
			else if (7'd36 <= mouse_position && mouse_position < 7'd40)
				caught <= (ground[43:42] == 2'b11) + (ground[41:40] == 2'b11) + (ground[39:38] == 2'b11);
			else if (7'd40 <= mouse_position && mouse_position < 7'd44)
				caught <= (ground[41:40] == 2'b11) + (ground[39:38] == 2'b11) + (ground[37:36] == 2'b11);
			else if (7'd44 <= mouse_position && mouse_position < 7'd48)
				caught <= (ground[39:38] == 2'b11) + (ground[37:36] == 2'b11) + (ground[35:34] == 2'b11);
			else if (7'd48 <= mouse_position && mouse_position < 7'd52)
				caught <= (ground[37:36] == 2'b11) + (ground[35:34] == 2'b11) + (ground[33:32] == 2'b11);
			else if (7'd52 <= mouse_position && mouse_position < 7'd56)
				caught <= (ground[35:34] == 2'b11) + (ground[33:32] == 2'b11) + (ground[31:30] == 2'b11);
			else if (7'd56 <= mouse_position && mouse_position < 7'd60)
				caught <= (ground[33:32] == 2'b11) + (ground[31:30] == 2'b11) + (ground[29:28] == 2'b11);
			else if (7'd60 <= mouse_position && mouse_position < 7'd64)
				caught <= (ground[31:30] == 2'b11) + (ground[29:28] == 2'b11) + (ground[27:26] == 2'b11);
			else if (7'd64 <= mouse_position && mouse_position < 7'd68)
				caught <= (ground[29:28] == 2'b11) + (ground[27:26] == 2'b11) + (ground[25:24] == 2'b11);
			else if (7'd68 <= mouse_position && mouse_position < 7'd72)
				caught <= (ground[27:26] == 2'b11) + (ground[25:24] == 2'b11) + (ground[23:22] == 2'b11);
			else if (7'd72 <= mouse_position && mouse_position < 7'd76)
				caught <= (ground[25:24] == 2'b11) + (ground[23:22] == 2'b11) + (ground[21:20] == 2'b11);
			else if (7'd76 <= mouse_position && mouse_position < 7'd80)
				caught <= (ground[23:22] == 2'b11) + (ground[21:20] == 2'b11) + (ground[19:18] == 2'b11);
			else if (7'd80 <= mouse_position && mouse_position < 7'd84)
				caught <= (ground[21:20] == 2'b11) + (ground[19:18] == 2'b11) + (ground[17:16] == 2'b11);
			else if (7'd84 <= mouse_position && mouse_position < 7'd88)
				caught <= (ground[19:18] == 2'b11) + (ground[17:16] == 2'b11) + (ground[15:14] == 2'b11);
			else if (7'd88 <= mouse_position && mouse_position < 7'd92)
				caught <= (ground[17:16] == 2'b11) + (ground[15:14] == 2'b11) + (ground[13:12] == 2'b11);
			else if (7'd92 <= mouse_position && mouse_position < 7'd96)
				caught <= (ground[15:14] == 2'b11) + (ground[13:12] == 2'b11) + (ground[11:10] == 2'b11);
			else if (7'd96 <= mouse_position && mouse_position < 7'd100)
				caught <= (ground[13:12] == 2'b11) + (ground[11:10] == 2'b11) + (ground[9:8] == 2'b11);
			else if (7'd100 <= mouse_position && mouse_position < 7'd104)
				caught <= (ground[11:10] == 2'b11) + (ground[9:8] == 2'b11) + (ground[7:6] == 2'b11);
			else if (7'd104 <= mouse_position && mouse_position < 7'd108)
				caught <= (ground[9:8] == 2'b11) + (ground[7:6] == 2'b11) + (ground[5:4] == 2'b11);
			else if (7'd108 <= mouse_position && mouse_position < 7'd112)
				caught <= (ground[7:6] == 2'b11) + (ground[5:4] == 2'b11) + (ground[3:2] == 2'b11);
			else if (7'd112 <= mouse_position && mouse_position < 7'd116)
				caught <= (ground[5:4] == 2'b11) + (ground[3:2] == 2'b11) + (ground[1:0] == 2'b11);
			else if (7'd116 <= mouse_position && mouse_position < 7'd120)
				caught <= (ground[3:2] == 2'b11) + (ground[1:0] == 2'b11);
	end
endmodule

module draw_score(input clock, input reset, input draw, input [7:0] input_x, input [7:0] input_x2, input [6:0] input_y, 
					input [59:0] map, input [29:0] lives_map,
					output reg [7:0] x, output reg [6:0] y, output reg [2:0] color,
										output reg finish_drawing);

	initial
        finish_drawing = 0;
	
	reg [5:0] index = 0;
	reg [4:0] j = 0;
	reg counter = 0;

	always @(posedge clock) begin
        if(!reset) begin
                x <= 7'd0;
                y <= 6'd0;
                color <= 3'd0;
                finish_drawing = 1'b0;
        end
		
		else begin
			if (draw == 1) begin
				if ( index < 60) begin
					finish_drawing <= 0;
					// assign x, y, and color here
					
					if (index < 6'd30) begin
						if (map[index]) begin
							// this segment must be drawn
							if (index < 6) begin
								if (counter == 0) begin
									x <= input_x + index;
									y <= input_y;
									color <= 3'b111;
								end
								else begin
									x <= input_x + index;
									y <= input_y + 6'd1;
									color <= 3'b111;
								end
							end
							else if (index < 12) begin
								if (counter == 0) begin
									x <= input_x + index - 6;
									y <= input_y + 6'd2;
									color <= 3'b111;
								end
								else begin
									x <= input_x + index - 6;
									y <= input_y + 6'd3;
									color <= 3'b111;
								end
							end
							else if (index < 18) begin
								if (counter == 0) begin
									x <= input_x + index - 12;
									y <= input_y + 6'd4;
									color <= 3'b111;
								end
								else begin
									x <= input_x + index - 12;
									y <= input_y + 6'd5;
									color <= 3'b111;
								end
							end
							else if (index < 24) begin
								if (counter == 0) begin
									x <= input_x + index - 18;
									y <= input_y + 6'd6;
									color <= 3'b111;
								end
								else begin
									x <= input_x + index - 18;
									y <= input_y + 6'd7;
									color <= 3'b111;
								end
							end
							else if (index < 30) begin
								if (counter == 0) begin
									x <= input_x + index - 24;
									y <= input_y + 6'd8;
									color <= 3'b111;
								end
								else begin
									x <= input_x + index - 24;
									y <= input_y + 6'd9;
									color <= 3'b111;
								end
							end
						end

						else begin
							// these squares should be black
							if (index < 6)begin
								if (counter == 0) begin
									x <= input_x + index;
									y <= input_y;
									color <= 3'd0;
								end
								else begin
									x <= input_x + index;
									y <= input_y + 6'd1;
									color <= 3'd0;
								end
							end
							else if (index < 12) begin
								if (counter == 0) begin
									x <= input_x + index - 6;
									y <= input_y + 6'd2;
									color <= 3'd0;
								end
								else begin
									x <= input_x + index - 6;
									y <= input_y + 6'd3;
									color <= 3'd0;
								end
							end
							else if (index < 18) begin
								if (counter == 0) begin
									x <= input_x + index - 12;
									y <= input_y + 6'd4;
									color <= 3'd0;
								end
								else begin
									x <= input_x + index - 12;
									y <= input_y + 6'd5;
									color <= 3'd0;
								end
							end
							else if (index < 24) begin
								if (counter == 0) begin
									x <= input_x + index - 18;
									y <= input_y + 6'd6;
									color <= 3'd0;
								end
								else begin
									x <= input_x + index - 18;
									y <= input_y + 6'd7;
									color <= 3'd0;
								end
							end
							else if (index < 30) begin
								if (counter == 0) begin
									x <= input_x + index - 24;
									y <= input_y + 6'd8;
									color <= 3'd0;
								end
								else begin
									x <= input_x + index - 24;
									y <= input_y + 6'd9;
									color <= 3'd0;
								end
							end
						end
					end
					else begin
						if (map[index]) begin
							if (index < 36)begin
								if (counter == 0) begin
									x <= input_x + index - 8'd15;
									y <= input_y;
									color <= 3'b111;
								end
								else begin
									x <= input_x + index;
									y <= input_y + 6'd1;
									color <= 3'b111;
								end
							end
							else if (index < 42) begin
								if (counter == 0) begin
									x <= input_x + index - 6 - 8'd15;
									y <= input_y + 6'd2;
									color <= 3'b111;
								end
								else begin
									x <= input_x + index - 6 - 8'd15;
									y <= input_y + 6'd3;
									color <= 3'b111;
								end
							end
							else if (index < 48) begin
								if (counter == 0) begin
									x <= input_x + index - 12 - 8'd15;
									y <= input_y + 6'd4;
									color <= 3'b111;
								end
								else begin
									x <= input_x + index - 12 - 8'd15;
									y <= input_y + 6'd5;
									color <= 3'b111;
								end
							end
							else if (index < 54) begin
								if (counter == 0) begin
									x <= input_x + index - 18 - 8'd15;
									y <= input_y + 6'd6;
									color <= 3'b111;
								end
								else begin
									x <= input_x + index - 18 - 8'd15;
									y <= input_y + 6'd7;
									color <= 3'b111;
								end
							end
							else if (index < 60) begin
								if (counter == 0) begin
									x <= input_x + index - 24 - 8'd15;
									y <= input_y + 6'd8;
									color <= 3'b111;
								end
								else begin
									x <= input_x + index - 24 - 8'd15;
									y <= input_y + 6'd9;
									color <= 3'b111;
								end
							end
							else begin
								x <= input_x;
								y <= input_y;
								color <= 3'b111;
							end
						end
						else begin
							if (index < 36)begin
								if (counter == 0) begin
									x <= input_x + index - 8'd15;
									y <= input_y;
									color <= 3'd0;
								end
								else begin
									x <= input_x + index - 8'd15;
									y <= input_y + 6'd1;
									color <= 3'd0;
								end
							end
							else if (index < 42) begin
								if (counter == 0) begin
									x <= input_x + index - 6 - 8'd15;
									y <= input_y + 6'd2;
									color <= 3'd0;
								end
								else begin
									x <= input_x + index - 6 - 8'd15;
									y <= input_y + 6'd3;
									color <= 3'd0;
								end
							end
							else if (index < 48) begin
								if (counter == 0) begin
									x <= input_x + index - 12 - 8'd15;
									y <= input_y + 6'd4;
									color <= 3'd0;
								end
								else begin
									x <= input_x + index - 12 - 8'd15;
									y <= input_y + 6'd5;
									color <= 3'd0;
								end
							end
							else if (index < 54) begin
								if (counter == 0) begin
									x <= input_x + index - 18 - 8'd15;
									y <= input_y + 6'd6;
									color <= 3'd0;
								end
								else begin
									x <= input_x + index - 18 - 8'd15;
									y <= input_y + 6'd7;
									color <= 3'd0;
								end
							end
							else if (index < 60) begin
								if (counter == 0) begin
									x <= input_x + index - 24 - 8'd15;
									y <= input_y + 6'd8;
									color <= 3'd0;
								end
								else begin
									x <= input_x + index - 24 - 8'd15;
									y <= input_y + 6'd9;
									color <= 3'd0;
								end
							end
							else begin
								x <= input_x;
								y <= input_y;
								color <= 3'd0;
							end
						end
					end
					begin
						if (counter) begin
							index = index + 1;
							counter = 0;
						end
						else
							counter = 1;
					end
				end

				else if(index == 6'd60 && j < 5'd30) begin
				// time to draw the lives
					if (lives_map[j] == 0)
						color <= 3'b000;
					else
						color <= 3'b111;

				    x <= input_x2 + (j % 6);
					if (counter) begin
						y <= input_y + 2 * (j / 6);
						counter = 0;
						j = j + 1;
					end
					else begin
						y <= input_y + 2 * (j / 6) + 1;
						counter = 1;
					end
				end

				else begin
					finish_drawing <= 1;
					index = 6'd0;
					j = 5'd0;
				end
			end
		end
	end
endmodule

module single_decimal_decoder(output reg [29:0] map, input [3:0] lives, input clk, input resetn);

	always @(posedge clk) begin
		case (lives)
			4'd0: map <= 30'b111111100001100001100001111111;
			4'd1: map <= 30'b001000001000001000001000001000;
			4'd2: map <= 30'b111111000001111111100000111111;
			4'd3: map <= 30'b111111100000111111100000111111;
			4'd4: map <= 30'b100000100000111111100001100001;
			4'd5: map <= 30'b111111100000111111000001111111;
			4'd6: map <= 30'b111111100001111111000001111111;
			4'd7: map <= 30'b100000100000100000100000111111;
			4'd8: map <= 30'b111111100001111111100001111111;
			4'd9: map <= 30'b111111100000111111100001111111;
			default: map <= 30'b111111100001100001100001111111;
		endcase

		if (!resetn)
			map <= 30'd0;
	end
endmodule

module decimal_decoder(output reg [59:0] map, input [6:0] score, input clk, input resetn);
	wire [3:0] first_digit, second_digit;
	two_digits t0(score, first_digit, second_digit, clk);
	reg [14:0] map_first_digit;
	reg [14:0] map_second_digit;
	reg [3:0] mid_map_first;
	reg [3:0] mid_map_second;
	always @(posedge clk) begin
		mid_map_first <= first_digit;
		case (mid_map_first)
			4'd0: map_first_digit = 30'b111111100001100001100001111111;
			4'd1: map_first_digit = 30'b001000001000001000001000001000;
			4'd2: map_first_digit = 30'b111111000001111111100000111111;
			4'd3: map_first_digit = 30'b111111100000111111100000111111;
			4'd4: map_first_digit = 30'b100000100000111111100001100001;
			4'd5: map_first_digit = 30'b111111100000111111000001111111;
			4'd6: map_first_digit = 30'b111111100001111111000001111111;
			4'd7: map_first_digit = 30'b100000100000100000100000111111;
			4'd8: map_first_digit = 30'b111111100001111111100001111111;
			4'd9: map_first_digit = 30'b111111100000111111100001111111;
			default: map_first_digit = 30'b111111100001100001100001111111;
		endcase
	end
	always @(posedge clk) begin
		mid_map_second <= second_digit;
		case (mid_map_second)
			4'd0: map_second_digit = 30'b111111100001100001100001111111;
			4'd1: map_second_digit = 30'b001000001000001000001000001000;
			4'd2: map_second_digit = 30'b111111000001111111100000111111;
			4'd3: map_second_digit = 30'b111111100000111111100000111111;
			4'd4: map_second_digit = 30'b100000100000111111100001100001;
			4'd5: map_second_digit = 30'b111111100000111111000001111111;
			4'd6: map_second_digit = 30'b111111100001111111000001111111;
			4'd7: map_second_digit = 30'b100000100000100000100000111111;
			4'd8: map_second_digit = 30'b111111100001111111100001111111;
			4'd9: map_second_digit = 30'b111111100000111111100001111111;
			default: map_second_digit = 30'b111111100001100001100001111111;
		endcase
	end
	always @(posedge clk)begin
		if (!resetn)
			map <= 30'd0;
		else
			map <= {map_second_digit, map_first_digit};
	end
endmodule

module two_digits(input [6:0] score, output reg [3:0] first_digit, output reg [3:0] second_digit, input clk);
	reg [6:0] mid_way;
	always @(posedge clk) begin
		if (score < 7'd10) begin
			first_digit <= 4'd0;
			second_digit <= score[3:0];
		end
		else if (score < 7'd20) begin
			first_digit <= 4'd1;
			mid_way <= score - 7'd10;
			second_digit <= mid_way[3:0];
		end
		else if (score < 7'd30) begin
			first_digit <= 4'd2;
			mid_way <= score - 7'd20;
			second_digit <= mid_way[3:0];
		end
		else if (score < 7'd40) begin
			first_digit <= 4'd3;
			mid_way <= score - 7'd30;
			second_digit <= mid_way[3:0];
		end
		else if (score < 7'd50) begin
			first_digit <= 4'd4;
			mid_way <= score - 7'd40;
			second_digit <= mid_way[3:0];
		end
		else if (score < 7'd60) begin
			first_digit <= 4'd5;
			mid_way <= score - 7'd50;
			second_digit <= mid_way[3:0];
		end
		else if (score < 7'd70) begin
			first_digit <= 4'd6;
			mid_way <= score - 7'd60;
			second_digit <= mid_way[3:0];
		end
		else if (score < 7'd80) begin
			first_digit <= 4'd7;
			mid_way <= score - 7'd70;
			second_digit <= mid_way[3:0];
		end
		else if (score < 7'd90) begin
			first_digit <= 4'd8;
			mid_way <= score - 7'd80;
			second_digit <= mid_way[3:0];
		end
		else begin
			first_digit <= 4'd9;
			mid_way <= score - 7'd90;
			second_digit <= mid_way[3:0];
		end
	end
endmodule