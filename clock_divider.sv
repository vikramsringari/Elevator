
module clock_divider_testbench();
	logic clock;
	logic [31:0] divided_clocks;
	
	clock_divider dut (.clock, .divided_clocks);
	
	// Set up the clock
	parameter CLOCK_PERIOD = 100;
	initial clock = 1;
	always begin
		#(CLOCK_PERIOD / 2);
		clock = ~clock;
	end 
	
	// Set up the inputs to the design. Each line is a clock cycle.
	initial begin
		
		clock <= 0; 					 			@(posedge clock);
														@(posedge clock);
		clock <= 1;				 					@(posedge clock);
														@(posedge clock);
		clock <= 1;				 					@(posedge clock);
														@(posedge clock);
		clock <= 0;									@(posedge clock);
														@(posedge clock);
		clock <= 1;              				@(posedge clock);
														@(posedge clock);	
			$stop;
	end
endmodule	