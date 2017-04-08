module LFSR (clk, reset, d, q);
	input logic clk, reset, d;
	output logic q;
	always_ff @(posedge clk) 
        	if(reset)
				q <= 1'b0;
			else
				q <= d;
endmodule
	
module LFSR_testbench();
	logic clk, reset, d, q;
	
	LFSR dut (.clk, .reset, .d, .q);
	
	// Set up the clock
	parameter CLOCK_PERIOD = 100;
	initial clk = 1;
	always begin
		#(CLOCK_PERIOD / 2);
		clk = ~clk;
	end 
	
	initial begin	
														@(posedge clk);
														@(posedge clk);
		reset  <= 1; 					 			@(posedge clk);
		reset  <= 0; 					 			@(posedge clk);
						d <= 1;	    		@(posedge clk);
		                           			@(posedge clk);
						d <= 1;  				@(posedge clk);
														@(posedge clk);
						d <= 0;				@(posedge clk);
														@(posedge clk);
						d <= 1;  				@(posedge clk);
														@(posedge clk);
						d <= 0;				@(posedge clk);
														@(posedge clk);
						d <= 1;  				@(posedge clk);
														@(posedge clk);
		reset  <= 1; 					 			@(posedge clk);
		reset  <= 0; 					 			@(posedge clk);
		d <= 1; 				@(posedge clk);
														@(posedge clk);
		d <= 0;								@(posedge clk);
														@(posedge clk);
		d <= 1;              				@(posedge clk);
														@(posedge clk);
		d <= 0;								@(posedge clk);
		d <= 1;              				@(posedge clk);
														@(posedge clk);
		d <= 0;								@(posedge clk);
														@(posedge clk);
		d <= 1;              				@(posedge clk);
														@(posedge clk);

			$stop;
		end
endmodule  



