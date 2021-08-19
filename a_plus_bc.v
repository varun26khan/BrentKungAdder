module a_plus_bc(out,a,b,c);
	input a,b,c;
	output out;
	wire g;
	and G1 (g,b,c);
	or G2 (out,a,g);
endmodule