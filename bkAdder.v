module bkAdder(out,cout,ina,inb,cin);
	input [31:0] ina,inb;
	input cin;
	output [31:0] out;
	output cout;
	
	wire [32:0] c;
	wire [31:0] gi[1:6],pi[1:6];
	genvar i;
	generate for (i=0;i<32;i=i+1) begin:bkLVL1
		cla G1 (gi[1][i],pi[1][i],ina[i],inb[i]);
	end
	endgenerate
	generate for (i=0;i<16;i=i+1) begin:bkLVL2
		a_plus_bc G2 (gi[2][i],gi[1][2*i+1],pi[1][2*i+1],gi[1][2*i]);
		and G3 (pi[2][i],pi[1][2*i+1],pi[1][2*i]);
	end
	endgenerate
	generate for (i=0;i<8;i=i+1) begin:bkLVL3
		a_plus_bc G4 (gi[3][i],gi[2][2*i+1],pi[2][2*i+1],gi[2][2*i]);
		and G5 (pi[3][i],pi[2][2*i+1],pi[2][2*i]);
	end
	endgenerate
	generate for (i=0;i<4;i=i+1) begin:bkLVL4
		a_plus_bc G6 (gi[4][i],gi[3][2*i+1],pi[3][2*i+1],gi[3][2*i]);
		and G7 (pi[4][i],pi[3][2*i+1],pi[3][2*i]);
	end
	endgenerate
	generate for (i=0;i<2;i=i+1) begin:bkLVL5
		a_plus_bc G8 (gi[5][i],gi[4][2*i+1],pi[4][2*i+1],gi[4][2*i]);
		and G9 (pi[5][i],pi[4][2*i+1],pi[4][2*i]);
	end
	endgenerate
	generate for (i=0;i<1;i=i+1) begin:bkLVL6
		a_plus_bc G10 (gi[6][i],gi[5][2*i+1],pi[5][2*i+1],gi[5][2*i]);
		and G11 (pi[6][i],pi[5][2*i+1],pi[5][2*i]);
	end
	endgenerate
	generate for (i=0;i<32;i=i+1) begin:sum
		xor GSum (out[i],pi[1][i],c[i]);
	end
	endgenerate
	assign c[0] = cin;
	a_plus_bc G12 (c[1],gi[1][0],pi[1][0],c[0]);
	a_plus_bc G13 (c[2],gi[2][0],pi[2][0],c[0]);
	a_plus_bc G14 (c[3],gi[1][2],pi[1][2],c[2]);
	a_plus_bc G15 (c[4],gi[3][0],pi[3][0],c[0]);
	a_plus_bc G16 (c[5],gi[1][4],pi[1][4],c[4]);
	a_plus_bc G17 (c[6],gi[2][2],pi[2][2],c[4]);
	a_plus_bc G18 (c[7],gi[1][6],pi[1][6],c[6]);
	a_plus_bc G19 (c[8],gi[4][0],pi[4][0],c[0]);
	a_plus_bc G20 (c[9],gi[1][8],pi[1][8],c[8]);
	a_plus_bc G21 (c[10],gi[2][4],pi[2][4],c[8]);
	a_plus_bc G22 (c[11],gi[1][10],pi[1][10],c[10]);
	a_plus_bc G23 (c[12],gi[3][2],pi[3][2],c[8]);
	a_plus_bc G24 (c[13],gi[1][12],pi[1][12],c[12]);
	a_plus_bc G25 (c[14],gi[2][6],pi[2][6],c[12]);
	a_plus_bc G26 (c[15],gi[1][14],pi[1][14],c[14]);
	a_plus_bc G27 (c[16],gi[5][0],pi[5][0],c[0]);
	a_plus_bc G28 (c[17],gi[1][16],pi[1][16],c[16]);
	a_plus_bc G29 (c[18],gi[2][8],pi[3][2],c[16]);
	a_plus_bc G30 (c[19],gi[1][18],pi[1][18],c[18]);
	a_plus_bc G31 (c[20],gi[3][4],pi[3][4],c[16]);
	a_plus_bc G32 (c[21],gi[1][20],pi[1][20],c[20]);
	a_plus_bc G33 (c[22],gi[2][10],pi[2][10],c[20]);
	a_plus_bc G34 (c[23],gi[1][22],pi[1][22],c[22]);
	a_plus_bc G35 (c[24],gi[4][2],pi[4][2],c[16]);
	a_plus_bc G36 (c[25],gi[1][24],pi[1][24],c[24]);
	a_plus_bc G37 (c[26],gi[2][12],pi[2][12],c[24]);
	a_plus_bc G38 (c[27],gi[1][26],pi[1][26],c[26]);
	a_plus_bc G39 (c[28],gi[3][6],pi[3][6],c[24]);
	a_plus_bc G40 (c[29],gi[1][28],pi[1][28],c[28]);
	a_plus_bc G41 (c[30],gi[2][14],pi[2][14],c[28]);
	a_plus_bc G42 (c[31],gi[1][30],pi[1][30],c[30]);
	a_plus_bc G43 (c[32],gi[6][0],pi[6][0],c[0]);
	assign cout = c[32];
endmodule
	