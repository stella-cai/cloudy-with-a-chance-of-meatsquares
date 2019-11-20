module random(register_num, bit_val);
	output [3:0] register_num;
	output [1:0] bit_val;
	initial
		begin
			register_num = $urandom%15;
			bit_val = $urandom%2;
		end
endmodule