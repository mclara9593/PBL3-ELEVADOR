module debounce (
	input clk, botao,
	output out
	);
	
	flip_flop_d (clk, botao, 1, 0, Q0);
	flip_flop_d (clk, Q0, 1, 0, Q1);
	
	and (out, Q0, ~Q1);
	
endmodule 