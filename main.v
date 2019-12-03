module main
	(
		CLOCK_50,						//	On Board 50 MHz
		// Your inputs and outputs here
        KEY,
		// The ports below are for the VGA output.  Do not change.
		VGA_CLK,   						//	VGA Clock
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_BLANK_N,						//	VGA BLANK
		VGA_SYNC_N,						//	VGA SYNC
		VGA_R,   						//	VGA Red[9:0]
		VGA_G,	 						//	VGA Green[9:0]
		VGA_B,   						//	VGA Blue[9:0]
		//The ports below are for mouse input.
		PS2_CLK,
		PS2_DAT
	);

	input			CLOCK_50;				//	50 MHz
	input   [3:0]   KEY;

	// Declare your inputs and outputs here
	// Do not change the following outputs
	output			VGA_CLK;   				//	VGA Clock
	output			VGA_HS;					//	VGA H_SYNC
	output			VGA_VS;					//	VGA V_SYNC
	output			VGA_BLANK_N;				//	VGA BLANK
	output			VGA_SYNC_N;				//	VGA SYNC
	output	[9:0]	VGA_R;   				//	VGA Red[9:0]
	output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
	output	[9:0]	VGA_B;   				//	VGA Blue[9:0]
	
	inout PS2_CLK, PS2_DAT;
	
	wire reset;
	assign reset = KEY[0];

	wire start;
	assign start = ~KEY[1];
	
	// Create the colour, x, y and writeEn wires that are inputs to the controller.
	wire [2:0] color;
	wire [7:0] x;
	wire [6:0] y;

    wire plot;

	// Create an Instance of a VGA controller - there can be only one!
	// Define the number of colours as well as the initial background
	// image file (.MIF) for the controller.
	vga_adapter VGA(
	 		.resetn(reset),
	 		.clock(CLOCK_50),
	 		.colour(color),
	 		.x(x),
	 		.y(y),
	 		.plot(plot),
	 		.VGA_R(VGA_R),
	 		.VGA_G(VGA_G),
	 		.VGA_B(VGA_B),
	 		.VGA_HS(VGA_HS),
	 		.VGA_VS(VGA_VS),
	 		.VGA_BLANK(VGA_BLANK_N),
	 		.VGA_SYNC(VGA_SYNC_N),
			.VGA_CLK(VGA_CLK));
	 	defparam VGA.RESOLUTION = "160x120";
	 	defparam VGA.MONOCHROME = "FALSE";
		defparam VGA.BITS_PER_COLOUR_CHANNEL = 1;
	 	defparam VGA.BACKGROUND_IMAGE = "black.mif";
    
	wire draw_squares, draw_catcher; 
    wire reset_count, delay_enable;
	wire finish_game, finish_drawing_squares, finish_drawing_catcher;
	wire [7:0] x_sky;
	wire [6:0] y_sky;
	wire [7:0] x_catcher;
	wire [6:0] y_catcher;

	wire [2:0] color_sky, color_catcher;
    
	delay_counter d(CLOCK_50, delay_enable, reset);
	
	control c(.clock(CLOCK_50), .reset(reset), .start(start), 
	.delay_enable(delay_enable), 
	.finish_game(1'b0), 
	.update(update), 
	.plot(plot), 
	.draw_squares(draw_squares), .draw_catcher(draw_catcher), 
	.reset_count(reset_count), 
	.finish_drawing_squares(finish_drawing_squares), .finish_drawing_catcher(finish_drawing_catcher)); 
	
	sky s(CLOCK_50, reset, delay_enable, draw_squares, x_sky, y_sky, color_sky, finish_drawing_squares);

	catcher catch(.clock(CLOCK_50), .reset(reset), .enable_tracking(1'b1), .draw(draw_catcher),
					.PS2_CLK(PS2_CLK), .PS2_DAT(PS2_DAT), 
					.x(x_catcher), .y(y_catcher), .color(color_catcher), .finish_drawing(finish_drawing_catcher));

	vga_select select(CLOCK_50, x_sky, y_sky, color_sky,
					x_catcher, y_catcher, color_catcher,
					draw_catcher, draw_squares,
					x, y, color);
endmodule

module vga_select(input clock,
					input [7:0] x_sky, input [6:0] y_sky, input [2:0] color_sky,
					input [7:0] x_catcher, input [6:0] y_catcher, input [2:0] color_catcher,
					input draw_catcher, input draw_squares,
					output reg [7:0] x, output reg [6:0] y, output reg [2:0] color);

	always @(posedge clock) begin

		if(draw_squares == 1'b1) begin
			color <= color_sky;
			x <= x_sky;
			y <= y_sky;
		end

		else if(draw_catcher == 1'b1) begin
			color <= color_catcher;
			x <= x_catcher;
			y <= y_catcher;
		end
	end

endmodule

