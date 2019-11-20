module sky(clock, reset, update, draw,
			x, y, color, finish_drawing);

	input clock, reset, update, draw;
	output [7:0] x;
	output [6:0] y;
	output [2:0] color;
	output finish_drawing;

	wire [27:0] col1, col2, col3, col4;
	
	update_sky u(clock, update, reset, col1, col2, col3, col4);
	draw_cols d(clock, reset, col1, col2, col3, col4, draw, x, y, color, finish_drawing);

endmodule

module update_sky(clock, update, reset, col1, col2, col3, col4);
	input clock, update, reset;
	output reg [27:0] col1, col2, col3, col4;

	wire [3:0] rand_out;
	random rand(rand_out, update, reset);

	always @(posedge update)
	begin: updating_sky_meatballs
		$display("inside update");
		col1 <= col1 << 2;
		col2 <= col2 << 2;
		col3 <= col3 << 2;
		col4 <= col4 << 2;
		case (rand_out)
			4'd1 : begin
				col1[1:0] <= 10;
			end
			4'd2 : begin
				col2[1:0] <= 10;
			end
			4'd3 : begin
				col3[1:0] <= 10;
			end
			4'd4 : begin
				col4[1:0] <= 10;
			end
			default: begin
			end
		endcase
	end

	always @(*)
	begin
		if(!reset) begin
			col1 <= 0;
			col2 <= 0;
			col3 <= 0;
			col4 <= 0;
		end
	end

endmodule

module draw_cols(clock, reset, col1, col2, col3, col4, draw, x, y, color, finish_drawing);
	input clock, reset;
	input [27:0] col1, col2, col3, col4;
	input draw;
	output reg [7:0] x;
	output reg [6:0] y;
	output reg [2:0] color;
	output reg finish_drawing;

	integer i = 0;
	integer j = 0;
	integer k = 0;

	initial
		finish_drawing = 0;

	always @(posedge clock) begin
		$display("inside draw 2");

		
		if (draw == 1) begin
			finish_drawing = 0;

			//drawing col1
			if (i < 28) begin
				if (col1[i +: 2] == 0) begin
					color <= 3'b000;
				end
				else begin
					color <= 3'b111;
				end

				x <= 0 + (k / 8);
				y <= (i/2) * 8 + (k % 8);

				if (k == 63) begin
					i = i + 2;
					k = 0;
				end
				else begin
					k = k + 1;
				end
			end

			//drawing col2
			else if (i < 56) begin

				j = i - 28;
				if (col2[j +: 2] == 0) begin
					color <= 3'b000;
				end
				else begin
					color <= 3'b111;
				end

				x <= 8 + (k / 8);
				y <= (j/2) * 8 + (k % 8);
				
				if (k == 63) begin
					i = i + 2;
					k = 0;
				end
				else begin
					k = k + 1;
				end
			end

			//drawing col3
			else if (i < 84) begin
				j = i - 56;
				if (col3[j +: 2] == 0) begin
					color <= 3'b000;
				end]
				else begin
					color <= 3'b111;
				end

				x <= 16 + (k / 8);
				y <= (j/2) * 8 + (k % 8);
				
				if (k == 63) begin
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

	always @(*)
	begin
		if(!reset) begin
			$display("IM GETTING RESET");
			x <= 0;
			y <= 0;
			color <= 0;
			i = 0;
			j = 0;
			k = 0;
			finish_drawing = 0;
		end
	end

	
endmodule
