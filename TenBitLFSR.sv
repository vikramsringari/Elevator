module TenBitLFSR (clk, reset, dffwire);
	input logic clk, reset;
	output logic [9:0] dffwire;
	logic xnor_out;
	//logic [9:0] dffwire;
	
	//assign dffwire[9:0] = dffwire[9:0];
	

	LFSR q1 (.clk, .reset, .d(xnor_out), .q(dffwire[0]));
	LFSR q2 (.clk, .reset, .d(dffwire[0]), .q(dffwire[1]));
	LFSR q3 (.clk, .reset, .d(dffwire[1]), .q(dffwire[2]));
	LFSR q4 (.clk, .reset, .d(dffwire[2]), .q(dffwire[3]));
	LFSR q5 (.clk, .reset, .d(dffwire[3]), .q(dffwire[4]));
	LFSR q6 (.clk, .reset, .d(dffwire[4]), .q(dffwire[5]));
	LFSR q7 (.clk, .reset, .d(dffwire[5]), .q(dffwire[6]));
	LFSR q8 (.clk, .reset, .d(dffwire[6]), .q(dffwire[7]));
	LFSR q9 (.clk, .reset, .d(dffwire[7]), .q(dffwire[8]));
	LFSR q10 (.clk, .reset, .d(dffwire[8]), .q(dffwire[9]));
	
	assign xnor_out = ~(dffwire[9] ^ dffwire[6]);
endmodule
	
module TenBitLFSR_testbench();
	logic clk, reset, dffwire;
	
	TenBitLFSR dut (.clk, .reset, .dffwire);
	
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
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
		reset  <= 1; 					 			@(posedge clk);
		reset  <= 0; 					 			@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);

			$stop;
		end
endmodule  

