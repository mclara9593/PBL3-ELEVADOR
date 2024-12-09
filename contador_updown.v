module contador_updown (
	input fechada,clk, direcao,
	output a1,a0,
	output cheio
	);
	
	assign p = (~direcao & a0) | (a1 & ~a0) | (direcao & ~a1);
	
	and(cheio,p,1);
	
	
	
	and (w0, direcao, a0);
	and (w1, ~direcao, ~a0);
	or (j1, w0, w1);	

	flip_flop_jk (clk, 1, 1, p, a0);
	flip_flop_jk (clk, j1, j1, p, a1);

	//and(move,j1,fechada);
	
endmodule
