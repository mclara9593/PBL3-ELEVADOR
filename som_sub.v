module som_sub (
	input m, a, b, te,
	output s, ts);
	
	assign s = a ^ b ^ te;
	assign ts = (b & te) | (~m & a & te) | (~m & a & b) | (m & ~a & te) | (m & ~a & b);
	
	
endmodule 