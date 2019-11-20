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
		VGA_B   						//	VGA Blue[9:0]
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
	
	wire resetn;
	assign resetn = KEY[0];

	wire start;
	assign start = KEY[1];
	
	// Create the colour, x, y and writeEn wires that are inputs to the controller.
	wire [2:0] colour;
	wire [7:0] x;
	wire [6:0] y;

    wire plot;

	// Create an Instance of a VGA controller - there can be only one!
	// Define the number of colours as well as the initial background
	// image file (.MIF) for the controller.
	// vga_adapter VGA(
	// 		.resetn(resetn),
	// 		.clock(CLOCK_50),
	// 		.colour(colour),
	// 		.x(x),
	// 		.y(y),
	// 		.plot(plot),
	// 		/* Signals for the DAC to drive the monitor. */
	// 		.VGA_R(VGA_R),
	// 		.VGA_G(VGA_G),
	// 		.VGA_B(VGA_B),
	// 		.VGA_HS(VGA_HS),
	// 		.VGA_VS(VGA_VS),
	// 		.VGA_BLANK(VGA_BLANK_N),
	// 		.VGA_SYNC(VGA_SYNC_N),
	// 		.VGA_CLK(VGA_CLK));
	// 	defparam VGA.RESOLUTION = "160x120";
	// 	defparam VGA.MONOCHROME = "FALSE";
	// 	defparam VGA.BITS_PER_COLOUR_CHANNEL = 1;
	// 	defparam VGA.BACKGROUND_IMAGE = "black.mif";
    
	wire draw, erase;
    wire reset_count, enable;
    
endmodule