<<<<<<< HEAD
`include "control.v"
`include "delay_counter.v"

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
	
	wire reset;
	assign reset = KEY[0];

	wire start;
	assign start = KEY[1];
	
	// Create the colour, x, y and writeEn wires that are inputs to the controller.
	wire [2:0] color;
	wire [7:0] x;
	wire [6:0] y;

    wire plot;

	// Create an Instance of a VGA controller - there can be only one!
	// Define the number of colours as well as the initial background
	// image file (.MIF) for the controller.
	// vga_adapter VGA(
	// 		.reset(reset),
	// 		.clock(CLOCK_50),
	// 		.colour(color),
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
    
	wire draw; 
    wire reset_count, delay_enable;
	wire finish_game, finish_drawing;
    
	delay_counter d(CLOCK_50, delay_enable, reset);
	control c(.clock(CLOCK_50), .reset(reset), .start(start), .delay_enable(delay_enable), 
	.finish_game(1'b0), .update(update), .plot(plot), .draw(draw), .reset_count(reset_count), .finish_drawing(finish_drawing)); 
	sky s(CLOCK_50, reset, delay_enable, draw, x, y, color, finish_drawing);


endmodule

=======
module main(SW, KEY, CLOCK_50,
			VGA_CLK,   						//	VGA Clock
			VGA_HS,							//	VGA H_SYNC
			VGA_VS,							//	VGA V_SYNC
			VGA_BLANK_N,						//	VGA BLANK
			VGA_SYNC_N,						//	VGA SYNC
			VGA_R,   						//	VGA Red[9:0]
			VGA_G,	 						//	VGA Green[9:0]
			VGA_B );
		input [9:0] SW;
		input [3:0] KEY;
		input CLOCK_50;
		
		wire go = SW[1];
		wire resetn = SW[0];
		
		wire falling_rate;
		wire appearing_rate;
		wire refresh_rate;
		rate_divider r0(falling_rate, 30'd1785715, resetn, CLOCK_50);
		rate_divider r1(appearing_rate, 30'd24999999, resetn, CLOCK_50);
		rate_divider r3(refresh_rate, 30'd2000, resetn, CLOCK_50);
		
		/* reg [27:0] reg0;
		reg [27:0] reg1;
		reg [27:0] reg2;
		reg [27:0] reg3;
		reg [27:0] reg4;
		reg [27:0] reg5;
		reg [27:0] reg6;
		reg [27:0] reg7;
		reg [27:0] reg8;
		reg [27:0] reg9;
		reg [27:0] reg10;
		reg [27:0] reg11;
		reg [27:0] reg12;
		reg [27:0] reg13;
		reg [27:0] reg14;
		reg [27:0] reg15; */
		wire [27:0] q;
		
		always @(posedge falling_rate)
			begin
				if (!resetn)
					for (i = 0; i <= 32; i = i + 1)
						begin
							ram32x28 ram0(i, CLOCK_50, 28'd0, 1'b1, q);
						end
				else
					for (i = 0; i <= 15; i = i + 1)
						begin
							ram32x28 ram1(i, CLOCK_50, 28'd0, 1'b0, q);
							ram32x28 ram2(i, CLOCK_50, q << 2'd2, 1'b1, q);
						end
			end
			
		wire [3:0] register_num;
		wire [3:0] bit_val;
		
		always @(posedge appearing_rate)
			begin
				if (!resetn)
					for (i = 0; i <= 32; i = i + 1)
						begin
							ram32x28 ram3(i, CLOCK_50, 28'd0, 1'b1, q);
						end
				else
					begin
						random ran(register_num, CLOCK_50, resetn);
						random ran(bit_val, CLOCK_50, resetn);
						ram32x28 ram4(register_num, CLOCK_50, 28'd0, 1'b0, q);
						ram32x28 ram5(register_num, CLOCK_50, {q[27:2], bit_val[1:0]}, 1'b1, q);
					end
			end
		
		always @(posedge refresh_rate)
			begin
				for (i = 0; i <= 15; i = i + 1)
						begin
							ram32x28 ram3(i, CLOCK_50, 28'd0, 1'b0, q);
							update_register update0(q, 8'd8 * i, 7'd0, CLOCK_50,
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
>>>>>>> 02ecd957c9fbee3e9c1f953b9cd5afe1bccbb696
