module tb_adder;
	parameter N=32; 
   reg [N-1:0] A,B;
   reg CIN;
   wire [N-1:0] BKSUM,RCSUM;
   wire BKCOUT,RCCOUT;
	reg flag;
	reg clk;
	integer i;
    
   adder ADD(.outbk(BKSUM),.outrc(RCSUM),.coutbk(BKCOUT),.coutrc(RCCOUT),.ina(A),.inb(B),.cin(CIN),.clk(clk));
	
	initial begin
		flag = 1'b1;
		clk = 0;
		i = 0;
		A = 32'b0;
      B = 32'b0;
      CIN = 1'b0;
		clk = 0;
		forever
			#10 clk = ~clk;
	end
	
   always@(posedge clk) begin
		if(i==100) begin
			if(flag) 
				$display("DESIGN VERIFIED");
			else
				$display("DESIGN NOT VREIFIED");
			$finish;
		end
		else begin
			#5 input_generate(A,B,CIN);
			i=i+1;
		end
	end
		
	always@(negedge clk) 
		flag = flag & ((BKCOUT~^RCCOUT) | &(BKSUM~^RCSUM));
	
	task input_generate;
   output [N-1:0] A_t,B_t;
   output CIN_t;
   begin
      A_t = $random % 32;
      B_t = $random % 32;
      CIN_t =$random;
   end
   endtask
	
endmodule
