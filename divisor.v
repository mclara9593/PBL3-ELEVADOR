module divisor(
   input clk,
   output clk_out, f_1s, clk_4hz);
  
   flip_flop_t a0 ( clk, 1, s0);
   flip_flop_t a1 ( s0 , 1, s1);
   flip_flop_t a2 ( s1 ,  1, s2);
   flip_flop_t a3 ( s2 ,  1, s3);
   flip_flop_t a4 ( s3 ,  1, s4);
   flip_flop_t a5 ( s4 ,  1, s5);
   flip_flop_t a6 ( s5 ,  1, s6);
   flip_flop_t a7 ( s6 ,  1, s7);
   flip_flop_t a8 ( s7 ,  1, s8);
   flip_flop_t a10 ( s8 ,  1, s9);
   flip_flop_t a11 ( s9 ,  1, s10);
   flip_flop_t a12 ( s10,  1, s11);
   flip_flop_t a13 ( s11,  1, s12);
   flip_flop_t a14 ( s12,  1, s13);
   flip_flop_t a15 ( s13,  1, s14);
   flip_flop_t a16 ( s14,  1, s15);
   flip_flop_t a17 ( s15,  1, s16);
   flip_flop_t a18 ( s16,  1, s17);
   flip_flop_t a19 ( s17,  1, s18);
   flip_flop_t a20 ( s18,  1, s19);
   flip_flop_t a21 ( s19,  1, s20);
   flip_flop_t a22 ( s20,  1, s21);
   flip_flop_t a23 ( s21,  1, s22);
   flip_flop_t a24 ( s22,  1, s23);
   flip_flop_t a25 ( s23,  1, f_1s);
	
	assign clk_4hz = s22;
   assign clk_out = s18;
endmodule 