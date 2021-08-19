module FAdd(s,cout,a,b,cin);
	input a,b,cin;
	output s,cout;
	wire sig[2:0];
	
	xor G1 (sig[0],a,b);
	xor G2 (s,cin,sig[0]);
	and G3 (sig[1],a,b);
	and G4 (sig[2],cin,sig[0]);
	or G5 (cout,sig[1],sig[2]);
endmodule
