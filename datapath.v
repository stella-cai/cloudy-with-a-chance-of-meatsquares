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

module update_register(register_value, x_value);
	initial
		begin
			for (i = 0; i <= 11; i = i + 2)
				begin
				end
		end 
endmodule

module draw_control(cont, plot, go, resetn, clk);
	output reg[5:0] cont;
	output plot;
	input go;
	input resetn, clk;
	always @(posedge clk)
		begin
			if (!resetn)
				cont <= 6'd0;
			else if (go)
				cont <= cont + 6'd1;
			else
				cont <= 6'd0;
		end
	assign plot = resetn;
endmodule

module draw_datapath(outX, outY, outColour, X, Y, colour, control, go, resetn, clk);
	output reg [7:0] outX;
	output reg [6:0] outY;
	output reg [2:0] outColour;
	input [7:0] X;
	input [6:0] Y;
	input [2:0] colour;
	input [5:0] control;
	input resetn, clk;
	
	reg [7:0] mid_x;
	reg [6:0] mid_y;
	always @(*)
		begin
			mid_x <= X + control[5:3];
			mid_y <= Y + control[2:0];
		end
	always @(posedge clk)
		begin
			if (!resetn)
				begin
					outX <= 4'd0;
					outY <= 4'd0;
					outColour <= 3'd0;
				end
			else
				begin
					if (go)
						begin
							outX <= mid_x;
							outY <= mid_y;
							outColour <= colour;
						end
				end
		end
endmodule