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

module draw
	(
		X, Y, colour, control, go, resetn, clk,
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

	input [7:0] X;
	input [6:0] Y;
	input [2:0] colour;
	input [5:0] control;
	input resetn, clk;

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
	
	// Create the colour, x, y and writeEn wires that are inputs to the controller.
	wire [2:0] colour;
	wire [7:0] x;
	wire [6:0] y;
	wire writeEn;

	// Create an Instance of a VGA controller - there can be only one!
	// Define the number of colours as well as the initial background
	// image file (.MIF) for the controller.
	vga_adapter VGA(
			.resetn(resetn),
			.clock(CLOCK_50),
			.colour(colour),
			.x(x),
			.y(y),
			.plot(writeEn),
			/* Signals for the DAC to drive the monitor. */
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
			
	// Put your code here. Your code should produce signals x,y,colour and writeEn/plot
	// for the VGA controller, in addition to any other functionality your design may require.
	wire mid_x;
	wire [3:0] cont;
	simple_register u0(mid_x, SW[6:0], KEY[3], KEY[0]);	
    datapath d0(x, y, colour, X, SW[6:0], SW[9:7], cont, KEY[3], KEY[0], CLOCK_50);
	control c0(cont, writeEn, KEY[1], KEY[0], CLOCK_50);
	
    // Instansiate datapath
	// datapath d0(...);

    // Instansiate FSM control
    // control c0(...);
    
endmodule