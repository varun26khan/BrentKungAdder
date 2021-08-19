module rcAdder(out,cout,ina,inb,cin);
	input [31:0] ina,inb;
	input cin;
	output [31:0] out;
	output cout;
	wire c[32:0];
	
	assign c[0] = cin;
	assign cout = c[32];
	genvar i;
	generate
		for (i = 0;i < 32;i = i + 1) begin : FAddx32
			FAdd M0 (out[i],c[i+1],ina[i],inb[i],c[i]);
		end
	endgenerate
endmodule

	