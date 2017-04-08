module comparator  #(parameter WIDTH=10)(A, B, out);
	input logic [WIDTH-1:0]A, B;
	output logic out;
	always_comb begin
		if(A>B)
			out = 1'b1;
		else
			out = 1'b0;
	end
endmodule

module comparator_testbench();
	logic A, B, out;
	
	comparator dut (.A, .B, .out);
		initial begin
				#10;A = 0; B=0; 
				#10;A = 1; 
				#10;B = 1; 
				#10;A = 0; 
				#10;B = 0;
		end

endmodule 
		
	


	