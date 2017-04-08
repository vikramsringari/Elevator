module game_play (clk, reset, L, R, LEDR);
	input logic clk, reset;
	input logic L, R;
	output logic [9:1] LEDR;
	//output logic [6:0] HEX0, HEX1;
	
	
	
	normalLight LED1(.clk, .reset, .L, .R, .NL(LEDR[2]), .NR(1'b0), .lightOn(LEDR[1]));
	normalLight LED2(.clk, .reset, .L, .R, .NL(LEDR[3]), .NR(LEDR[1]), .lightOn(LEDR[2]));
	normalLight LED3(.clk, .reset, .L, .R, .NL(LEDR[4]), .NR(LEDR[2]), .lightOn(LEDR[3]));
	normalLight LED4(.clk, .reset, .L, .R, .NL(LEDR[5]), .NR(LEDR[3]), .lightOn(LEDR[4]));
	centerLight LED5(.clk, .reset, .L, .R, .NL(LEDR[6]), .NR(LEDR[4]), .lightOn(LEDR[5]));
	normalLight LED6(.clk, .reset, .L, .R, .NL(LEDR[7]), .NR(LEDR[5]), .lightOn(LEDR[6]));
	normalLight LED7(.clk, .reset, .L, .R, .NL(LEDR[8]), .NR(LEDR[6]), .lightOn(LEDR[7]));
	normalLight LED8(.clk, .reset, .L, .R, .NL(LEDR[9]), .NR(LEDR[7]), .lightOn(LEDR[8]));
	normalLight LED9(.clk, .reset, .L, .R, .NL(1'b0), .NR(LEDR[8]), .lightOn(LEDR[9]));
	

	
endmodule

module game_play_testbench();
	logic clk, reset, L, R;
	logic [9:1]  LEDR;
	logic [6:0]  HEX0;
	
	game_play dut (.clk, .reset, .L, .R, .LEDR);
	
	// Set up the clock
	parameter CLOCK_PERIOD = 100;
	initial clk = 1;
	always begin
		#(CLOCK_PERIOD / 2);
		clk = ~clk;
	end 
	
	// Set up the inputs to the design. Each line is a clock cycle.
	initial begin	
												@(posedge clk);
		reset <= 1;							@(posedge clk);
		reset <= 0; L <= 0;R <= 0;		@(posedge clk);
												@(posedge clk);
					L <= 1;					@(posedge clk);
												@(posedge clk);
												@(posedge clk);
					L <= 1; R <= 1;		@(posedge clk);
												@(posedge clk);
					L <= 0;					@(posedge clk);
												@(posedge clk);
												@(posedge clk);
					L <= 1; 					@(posedge clk);
												@(posedge clk);
												@(posedge clk);
					L <= 0;					@(posedge clk);
												@(posedge clk);
												@(posedge clk);
					L <= 0; R <= 1;		@(posedge clk);
												@(posedge clk);
					L <= 1;					@(posedge clk);
												@(posedge clk);
												@(posedge clk);
					L <= 1; 					@(posedge clk);
												@(posedge clk);
					R <= 0;		 			@(posedge clk);
												@(posedge clk);
												@(posedge clk);
		reset <= 1;							@(posedge clk);
		reset <= 0; L <= 0;	R <= 0;	@(posedge clk);
												@(posedge clk);
					R <= 1;					@(posedge clk);
												@(posedge clk);
												@(posedge clk);
					L <= 1; R <= 1;		@(posedge clk);
												@(posedge clk);
					R <= 0;					@(posedge clk);
												@(posedge clk);
												@(posedge clk);
					R <= 1; 					@(posedge clk);
												@(posedge clk);
												@(posedge clk);
					R <= 0;					@(posedge clk);
												@(posedge clk);
												@(posedge clk);
					R <= 0; L <= 1;		@(posedge clk);
												@(posedge clk);
					R <= 1;					@(posedge clk);
												@(posedge clk);
												@(posedge clk);
					R <= 1; 					@(posedge clk);
												@(posedge clk);
							R <= 0; 			@(posedge clk);
												@(posedge clk);
												@(posedge clk);
		$stop;
	end
endmodule

	
	
	
	
	
	
	
