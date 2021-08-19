module cla(g,p,ina,inb);
	input ina,inb;
	output g,p;
	
	xor G1 (p,ina,inb);
	and G2 (g,ina,inb);
endmodule 