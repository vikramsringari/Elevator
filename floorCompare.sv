module floorCompare  #(parameter WIDTH=6)(A, B, greater, lesser, equal);
	input logic [WIDTH-1:0]A, B;
	output logic greater, lesser, equal; 
	logic [5:0] SW0, SW1, SW2, SW3, SW4, SW5;
	assign SW0 = {1'b0,1'b0,1'b0,1'b0,1'b0,A[0]};
	assign SW1 = {1'b0,1'b0,1'b0,1'b0,A[1],1'b0};
	assign SW2 = {1'b0,1'b0,1'b0,A[2],1'b0,1'b0};
	assign SW3 = {1'b0,1'b0,A[3],1'b0,1'b0,1'b0};
	assign SW4 = {1'b0,A[4],1'b0,1'b0,1'b0,1'b0};
	assign SW5 = {A[5],1'b0,1'b0,1'b0,1'b0,1'b0};
	always_comb begin
		if((SW1>B|SW2>B|SW3>B|SW4>B|SW5>B))
			greater = 1'b1;
		else
			greater = 1'b0;
		if(((SW0<B) & SW0 !=6'b000000)|((SW1<B) & SW1 !=6'b000000)|((SW2<B) & SW2 !=6'b000000)|((SW3<B) & SW3 !=6'b000000)|((SW4<B) & SW4 !=6'b000000)) 
			lesser = 1'b1;
		else 
			lesser = 1'b0;
		if ((SW0==B|SW1==B|SW2==B|SW3==B|SW4==B|SW5==B)) 
			equal = 1'b1;
		else
			equal = 1'b0;
		
	end	
endmodule

module floorCompare_testbench;
	logic [5:0] A, B;
	logic greater, lesser, equal;
	
	floorCompare dut (.A, .B, .greater, .lesser, .equal);
		initial begin
				#10;A = 6'b100000; B=6'b000001; 
				#10;A = 6'b100000; B=6'b100000;
				#10;A = 6'b000001; B=6'b100000;
				#10;A = 6'b001001; B=6'b000001;
				#10;A = 6'b101001; B=6'b001000;
		end

endmodule
		