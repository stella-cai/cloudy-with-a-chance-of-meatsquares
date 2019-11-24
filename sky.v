module sky(clock, reset, update, draw,
			x, y, color, finish_drawing);

	input clock, reset, update, draw;
	output [7:0] x;
	output [6:0] y;
	output [2:0] color;
	output finish_drawing;

	wire [55:0] col1, col2, col3, col4, col5, col6, col7, col8, col9, col10,
					col11, col12, col13, col14, col15, col16, col17, col18, col19, col20,
					col21, col22, col23, col24, col25, col26, col27, col28, col29, col30;
	
	update_sky u(clock, update, reset, 
					col1, col2, col3, col4, col5, col6, col7, col8, col9, col10,
					col11, col12, col13, col14, col15, col16, col17, col18, col19, col20,
					col21, col22, col23, col24, col25, col26, col27, col28, col29, col30);
					
	draw_cols d(clock, reset, 
					col1, col2, col3, col4, col5, col6, col7, col8, col9, col10,
					col11, col12, col13, col14, col15, col16, col17, col18, col19, col20,
					col21, col22, col23, col24, col25, col26, col27, col28, col29, col30,
					draw, x, y, color, finish_drawing);

endmodule

module update_sky(clock, update, reset, col1, col2, col3, col4, col5, col6, col7, col8, col9, col10,
					col11, col12, col13, col14, col15, col16, col17, col18, col19, col20,
					col21, col22, col23, col24, col25, col26, col27, col28, col29, col30);
	input clock, update, reset;
	output reg [55:0] col1, col2, col3, col4, col5, col6, col7, col8, col9, col10,
					col11, col12, col13, col14, col15, col16, col17, col18, col19, col20,
					col21, col22, col23, col24, col25, col26, col27, col28, col29, col30;

	wire [11:0] rand_out;
	random randint(rand_out, clock, reset);

	always @(negedge reset, posedge update)
		if (!reset) begin
			col1 <= 0;
			col2 <= 0;
			col3 <= 0;
			col4 <= 0;
			col5 <= 0;
			col6 <= 0;
			col7 <= 0;
			col8 <= 0;
			col9 <= 0;
			col10 <= 0;
			col11 <= 0;
			col12 <= 0;
			col13 <= 0;
			col14 <= 0;
			col15 <= 0;
			col16 <= 0;
			col17 <= 0;
			col18 <= 0;
			col19 <= 0;
			col20 <= 0;
			col21 <= 0;
			col22 <= 0;
			col23 <= 0;
			col24 <= 0;
			col25 <= 0;
			col26 <= 0;
			col27 <= 0;
			col28 <= 0;
			col29 <= 0;
			col30 <= 0;
		end
		else if (update)
			begin: updating_sky_meatballs
				$display("inside update");
				col1 <= col1 << 2;
				col2 <= col2 << 2;
				col3 <= col3 << 2;
				col4 <= col4 << 2;
				col5 <= col5 << 2;
				col6 <= col6 << 2;
				col7 <= col7 << 2;
				col8 <= col8 << 2;
				col9 <= col9 << 2;
				col10 <= col10 << 2;
				col11 <= col11 << 2;
				col12 <= col12 << 2;
				col13 <= col13 << 2;
				col14 <= col14 << 2;
				col15 <= col15 << 2;
				col16 <= col16 << 2;
				col17 <= col17 << 2;
				col18 <= col18 << 2;
				col19 <= col19 << 2;
				col20 <= col20 << 2;
				col21 <= col21 << 2;
				col22 <= col22 << 2;
				col23 <= col23 << 2;
				col24 <= col24 << 2;
				col25 <= col25 << 2;
				col26 <= col26 << 2;
				col27 <= col27 << 2;
				col28 <= col28 << 2;
				col29 <= col29 << 2;
				col30 <= col30 << 2;
				$display("random: %b", rand_out);
				
				case (rand_out[11:0])

					//generate good meatsquares
					12'd1, 12'd101 : begin
						col1[1:0] <= 10;
					end
					12'd2, 12'd102 : begin
						col2[1:0] <= 10;
					end
					12'd3, 12'd103 : begin
						col3[1:0] <= 10;
					end
					12'd4, 12'd104 : begin
						col4[1:0] <= 10;
					end
					12'd5, 12'd105 : begin
						col5[1:0] <= 10;
					end
					12'd6, 12'd106 : begin
						col6[1:0] <= 10;
					end
					12'd7, 12'd107 : begin
						col7[1:0] <= 10;
					end
					12'd8, 12'd108 : begin
						col8[1:0] <= 10;
					end
					12'd9, 12'd109 : begin
						col9[1:0] <= 10;
					end
					12'd10, 12'd110 : begin
						col10[1:0] <= 10;
					end
					12'd11, 12'd111 : begin
						col11[1:0] <= 10;
					end
					12'd12, 12'd112 : begin
						col12[1:0] <= 10;
					end
					12'd13, 12'd113 : begin
						col13[1:0] <= 10;
					end
					12'd14, 12'd114 : begin
						col14[1:0] <= 10;
					end
					12'd15, 12'd115 : begin
						col15[1:0] <= 10;
					end
					12'd16, 12'd116 : begin
						col16[1:0] <= 10;
					end
					12'd17, 12'd117 : begin
						col17[1:0] <= 10;
					end
					12'd18, 12'd118 : begin
						col18[1:0] <= 10;
					end
					12'd19, 12'd119 : begin
						col19[1:0] <= 10;
					end
					12'd20, 12'd120 : begin
						col20[1:0] <= 10;
					end
					12'd21, 12'd121 : begin
						col21[1:0] <= 10;
					end
					12'd22, 12'd122 : begin
						col22[1:0] <= 10;
					end
					12'd23, 12'd123 : begin
						col23[1:0] <= 10;
					end
					12'd24, 12'd124 : begin
						col24[1:0] <= 10;
					end
					12'd25, 12'd125 : begin
						col25[1:0] <= 10;
					end
					12'd26, 12'd126 : begin
						col26[1:0] <= 10;
					end
					12'd27, 12'd127 : begin
						col27[1:0] <= 10;
					end
					12'd28, 12'd128 : begin
						col28[1:0] <= 10;
					end
					12'd29, 12'd129 : begin
						col29[1:0] <= 10;
					end
					12'd30, 12'd130 : begin
						col30[1:0] <= 10;
					end

					// generate bad meatsquares
					case (rand_out[11:0])
					// 12'd201 : begin
					// 	col1[1:0] <= 11;
					// end
					12'd202 : begin
						col2[1:0] <= 11;
					end
					// 12'd203 : begin
					// 	col3[1:0] <= 11;
					// end
					12'd204 : begin
						col4[1:0] <= 11;
					end
					// 12'd205 : begin
					// 	col5[1:0] <= 11;
					// end
					12'd206 : begin
						col6[1:0] <= 11;
					end
					// 12'd207 : begin
					// 	col7[1:0] <= 11;
					// end
					12'd208 : begin
						col8[1:0] <= 11;
					end
					// 12'd209 : begin
					// 	col9[1:0] <= 11;
					// end
					12'd210 : begin
						col10[1:0] <= 11;
					end
					// 12'd211 : begin
					// 	col11[1:0] <= 11;
					// end
					12'd212 : begin
						col12[1:0] <= 11;
					end
					// 12'd213 : begin
					// 	col13[1:0] <= 11;
					// end
					12'd214 : begin
						col14[1:0] <= 11;
					end
					// 12'd215 : begin
					// 	col15[1:0] <= 11;
					// end
					12'd216 : begin
						col16[1:0] <= 11;
					end
					// 12'd217 : begin
					// 	col17[1:0] <= 11;
					// end
					12'd218 : begin
						col18[1:0] <= 11;
					end
					// 12'd219 : begin
					// 	col19[1:0] <= 11;
					// end
					12'd220 : begin
						col20[1:0] <= 11;
					end
					// 12'd221 : begin
					// 	col21[1:0] <= 11;
					// end
					12'd222 : begin
						col22[1:0] <= 11;
					// end
					// 12'd223 : begin
					// 	col23[1:0] <= 11;
					// end
					12'd224 : begin
						col24[1:0] <= 11;
					end
					// 12'd225 : begin
					// 	col25[1:0] <= 11;
					// end
					12'd226 : begin
						col26[1:0] <= 11;
					end
					// 12'd227 : begin
					// 	col27[1:0] <= 11;
					// end
					12'd228 : begin
						col28[1:0] <= 11;
					end
					// 12'd229 : begin
					// 	col29[1:0] <= 11;
					// end
					// 12'd230 : begin
					// 	col30[1:0] <= 11;
					// end
					default: begin
					end
				endcase
			end

endmodule

module draw_cols(clock, reset, col1, col2, col3, col4, col5, col6, col7, col8, col9, col10,
					col11, col12, col13, col14, col15, col16, col17, col18, col19, col20,
					col21, col22, col23, col24, col25, col26, col27, col28, col29, col30,
					draw, x, y, color, finish_drawing);
	input clock, reset;
	input [55:0] col1, col2, col3, col4, col5, col6, col7, col8, col9, col10,
					col11, col12, col13, col14, col15, col16, col17, col18, col19, col20,
					col21, col22, col23, col24, col25, col26, col27, col28, col29, col30;
	input draw;
	output reg [7:0] x;
	output reg [6:0] y;
	output reg [2:0] color;
	output reg finish_drawing;

	reg [31:0] i = 0;
	reg [31:0] j = 0;
	reg [31:0] k = 0;

	initial
		finish_drawing = 0;

	always @(posedge clock) begin
		
		if(!reset) begin
			x <= 0;
			y <= 0;
			color <= 0;
			i = 0;
			j = 0;
			k = 0;
			finish_drawing = 0;
		end

		else begin
			if (draw == 1) begin
				finish_drawing = 0;

				//drawing col1
				if (i < 56) begin
					if (col1[i +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col1[i +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 0 + (k / 4);
					y <= (i/2) * 4 + (k % 4);

					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end

				//drawing col2
				else if (i < 56 * 2) begin

					j = i - 56;
					if (col2[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col2[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end

				//drawing col3
				else if (i < 56 * 3) begin
					j = i - 56 * 2;
					if (col3[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col3[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 2 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				else if (i < 56 * 4) begin
					j = i - 56 * 3;
					if (col4[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col4[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 3 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				else if (i < 56 * 5) begin
					j = i - 56 * 4;
					if (col5[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col5[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 4 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				else if (i < 56 * 6) begin
					j = i - 56 * 5;
					if (col6[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col6[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 5 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				else if (i < 56 * 7) begin
					j = i - 56 * 6;
					if (col7[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col7[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 6 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				else if (i < 56 * 8) begin
					j = i - 56 * 7;
					if (col8[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col8[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 7 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				else if (i < 56 * 9) begin
					j = i - 56 * 8;
					if (col9[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col9[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 8 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				else if (i < 56 * 10) begin
					j = i - 56 * 9;
					if (col10[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col10[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 9 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				
				else if (i < 56 * 11) begin
					j = i - 56 * 10;
					if (col11[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col11[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 10 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				
				else if (i < 56 * 12) begin
					j = i - 56 * 11;
					if (col12[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col12[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 11 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				else if (i < 56 * 13) begin
					j = i - 56 * 12;
					if (col13[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col13[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 12 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				
				else if (i < 56 * 14) begin
					j = i - 56 * 13;
					if (col14[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col14[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 13 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				
				else if (i < 56 * 15) begin
					j = i - 56 * 14;
					if (col15[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col15[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 14 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				
				else if (i < 56 * 16) begin
					j = i - 56 * 15;
					if (col16[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col16[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 15 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				
				else if (i < 56 * 17) begin
					j = i - 56 * 16;
					if (col17[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col17[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 16 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				
				else if (i < 56 * 18) begin
					j = i - 56 * 17;
					if (col18[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col18[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 17 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				
				else if (i < 56 * 19) begin
					j = i - 56 * 18;
					if (col19[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col19[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 18 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				
				else if (i < 56 * 20) begin
					j = i - 56 * 19;
					if (col20[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col20[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 19 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				
				else if (i < 56 * 21) begin
					j = i - 56 * 20;
					if (col21[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col21[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 20 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				
				else if (i < 56 * 22) begin
					j = i - 56 * 21;
					if (col22[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col22[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 21 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				
				else if (i < 56 * 23) begin
					j = i - 56 * 22;
					if (col23[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col23[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 22 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				
				else if (i < 56 * 24) begin
					j = i - 56 * 23;
					if (col24[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col24[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 23 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				
				else if (i < 56 * 25) begin
					j = i - 56 * 24;
					if (col25[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col25[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 24 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				
				else if (i < 56 * 26) begin
					j = i - 56 * 25;
					if (col26[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col26[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 25 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				
				else if (i < 56 * 27) begin
					j = i - 56 * 26;
					if (col27[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col27[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 26 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				
				else if (i < 56 * 28) begin
					j = i - 56 * 27;
					if (col28[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col28[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 27 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				
				else if (i < 56 * 29) begin
					j = i - 56 * 28;
					if (col29[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col29[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 28 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				
				else if (i < 56 * 30) begin
					j = i - 56 * 29;
					if (col30[j +: 2] == 0) begin
						color <= 3'b000;
					end
					else if (col30[j +: 2] == 2'b10) begin
						color <= 3'b011;
					end
					else begin
						color <= 3'b100;
					end

					x <= 4 * 29 + (k / 4);
					y <= (j/2) * 4 + (k % 4);
					
					if (k == 15) begin
						i = i + 2;
						k = 0;
					end
					else begin
						k = k + 1;
					end
				end
				

				else begin
					finish_drawing = 1;
					i = 0;
				end



			end
		end
				
	end	
endmodule
