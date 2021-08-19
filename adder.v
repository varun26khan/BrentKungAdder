module adder(outbk,outrc,coutbk,coutrc,ina,inb,cin,clk);
	input clk;
	input [31:0] ina,inb;
	input cin;
	output [31:0] outbk,outrc;
	output coutbk,coutrc;
	reg [64:0] flopin = 65'b0;
	reg [65:0] flopout = 66'b0;
	wire [31:0] flopin_A,flopin_B,flopout_bkSum,flopout_rcSum;
	wire flopin_C,flopout_bkC,flopout_rcC;
	always@(posedge clk) begin
		flopin[64:0] <= {cin,inb[31:0],ina[31:0]};
		flopout[65:0] <= {flopout_bkC,flopout_bkSum[31:0],flopout_rcC,flopout_rcSum[31:0]};
	end
	
	assign {flopin_C,flopin_B,flopin_A} = flopin[64:0];
	assign {coutbk,outbk,coutrc,outrc} = flopout[65:0];
	
	bkAdder ADD1 (flopout_bkSum,flopout_bkC,flopin_A,flopin_B,flopin_C);
	rcAdder ADD2 (flopout_rcSum,flopout_rcC,flopin_A,flopin_B,flopin_C);
endmodule
