
module rate_divider2(out_pulse, pulse_time, reset, clk);
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