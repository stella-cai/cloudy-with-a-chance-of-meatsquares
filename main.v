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