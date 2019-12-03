module decimal_decoder(output reg [29:0] map, input [6:0] score, input clk, input resetn);
	wire [3:0] first_digit, second_digit;
	two_digits t0(score, first_digit, second_digit, clk);
	reg [14:0] map_first_digit;
	reg [14:0] map_second_digit;
	reg [3:0] mid_map_first;
	reg [3:0] mid_map_second;
	always @(posedge clk)begin
		mid_map_first <= first_digit;
		case (mid_map_first)
			4'd0: map_first_digit = 15'b111101101101111;
			4'd1: map_first_digit = 15'b100100100100100;
			4'd2: map_first_digit = 15'b111001111100111;
			4'd3: map_first_digit = 15'b111100111100111;
			4'd4: map_first_digit = 15'b100100111101101;
			4'd5: map_first_digit = 15'b111100111001111;
			4'd6: map_first_digit = 15'b111101111001111;
			4'd7: map_first_digit = 15'b100100100100111;
			4'd8: map_first_digit = 15'b111101111101111;
			4'd9: map_first_digit = 15'b100100111101111;
	end
	always @(posedge clk)begin
		mid_map_second <= second_digit;
		case (mid_map_second)
			4'd0: map_second_digit = 15'b111101101101111;
			4'd1: map_second_digit = 15'b100100100100100;
			4'd2: map_second_digit = 15'b111001111100111;
			4'd3: map_second_digit = 15'b111100111100111;
			4'd4: map_second_digit = 15'b100100111101101;
			4'd5: map_second_digit = 15'b111100111001111;
			4'd6: map_second_digit = 15'b111101111001111;
			4'd7: map_second_digit = 15'b100100100100111;
			4'd8: map_second_digit = 15'b111101111101111;
			4'd9: map_second_digit = 15'b100100111101111;
	end
	always @(posedge clk)begin
		if (!resetn)
			map <= 30'd0;
		else
			map <= {map_first_digit, map_second_digit};
	end
endmodule

module two_digits(input [6:0] score, output reg [3:0] first_digit, output reg [3:0] second_digit, input clk);
	reg [6:0] mid_way;
	always @(posedge clk) begin
		if (score < 7'd10) begin
			first_digit = 4'd0;
			second_digit <= score[3:0];
		end
		else if (score < 7'd20) begin
			first_digit = 4'd1;
			mid_way <= score - 7'd10;
			second_digit <= mid_way[3:0];
		end
		else if (score < 7'd30) begin
			first_digit = 4'd2;
			mid_way <= score - 7'd20;
			second_digit <= mid_way[3:0];
		end
		else if (score < 7'd40) begin
			first_digit = 4'd3;
			mid_way <= score - 7'd30;
			second_digit <= mid_way[3:0];
		end
		else if (score < 7'd50) begin
			first_digit = 4'd4;
			mid_way <= score - 7'd40;
			second_digit <= mid_way[3:0];
		end
		else if (score < 7'd60) begin
			first_digit = 4'd5;
			mid_way <= score - 7'd50;
			second_digit <= mid_way[3:0];
		end
		else if (score < 7'd70) begin
			first_digit = 4'd6;
			mid_way <= score - 7'd60;
			second_digit <= mid_way[3:0];
		end
		else if (score < 7'd80) begin
			first_digit = 4'd7;
			mid_way <= score - 7'd70;
			second_digit <= mid_way[3:0];
		end
		else if (score < 7'd90) begin
			first_digit = 4'd8;
			mid_way <= score - 7'd80;
			second_digit <= mid_way[3:0];
		end
		else begin
			first_digit = 4'd9;
			mid_way <= score - 7'd90;
			second_digit <= mid_way[3:0];
		end
	end
endmodule