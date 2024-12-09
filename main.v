
module main (
	input clock, botao_entrar, botao_sair,
	input ch0,ch1,ch2,ch3,
	output dig1, dig2, dig3, dig4, 
	output segA, segB, segC, segD, segE, segF, segG, segP,
	output alarme
	);

	
	wire direcao,anterior1,anterior0;
	
	assign dig1 = ~clock_aux;
	assign dig2 = 1;
	assign dig3 = 1;
	assign dig4 = clock_aux;
	
	divisor (clock, clock_aux, clock_1hz, clock_4hz);
	
   mux_entradas(ch0,ch1,ch2,ch3,A1,A0);
	
	assign direcao= ~anterior1&~anterior0|| A1 & A0 || ~anterior1 & A1;   //A1=PROXIMO1 00=PROXIMO0
	
	/*pode mover
	
	fzr tabela de casos onde n transita e and com fechada
	*/
	contador_updown (fechada,clock_1hz, direcao, a1, a0,cheio);
	
	estado_porta(clk_out,0,cheio,1,fechada);
	
	reset_pessoas (clock_4hz, reset);
	
	assign max_pessoas = b2 & b1 & b0; 
	assign min_pessoas = ~b2 & ~b1 & ~b0;
	
	assign bot_in = botao_in & ~max_pessoas;
	assign bot_de = botao_de & ~min_pessoas;
	
	debounce (clock_aux, botao_entrar, botao_in);
	debounce (clock_aux, botao_sair, botao_de);

	assign m = bot_de;
	assign alarme = (b2 & b1 & ~b0) | (b2 & b1 & b0);
	pessoas (m, b2, b1, b0, 0, 0, 1, c2, c1, c0);
	
	flip_flop_d (clock_aux, c2, (bot_in | bot_de), reset, b2);
	flip_flop_d (clock_aux, c1, (bot_in | bot_de), reset, b1);
	flip_flop_d (clock_aux, c0, (bot_in | bot_de), reset, b0);
	
	mux_display (clock_aux, 0, a1, a0, b2, b1, b0, out2, out1, out0);
	
	decod_7seg (out2, out1, out0, segA, segB, segC, segD, segE, segF, segG, segP);
	
endmodule 