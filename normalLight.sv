module normalLight (clk, reset, L, R, NL, NR, lightOn);
	input logic clk, reset;
	 // L is true when left key is pressed, R is true when the right key
	// is pressed, NL is true when the light on the left is on, and NR
	// is true when the light on the right is on.
	input logic L, R, NL, NR;
	// when lightOn is true, the normal light should be on.
	output logic  lightOn;
	
	enum { on, off } ps, ns;
	
	always_comb begin
		lightOn = (ps == on);
	end
	// next state logic
	always_comb begin
		case (ps)
			on: 	if (R & L | ~R & ~L) 
						ns = on;
					else    
						ns = off;
			off:	if (NL & R & ~L | NR & L & ~R)  
						ns = on;
			    	else 	
						ns = off;
		endcase
	end
		
		
    // DFFs
    always_ff @(posedge clk)
    	if (reset)
         ps <= off; //only major difference
      else 
        	ps <= ns;

		 
	
endmodule

module normalLight_testbench();
	logic clk, reset, L, R, NL, NR, lightOn;
	
	normalLight dut (.clk, .reset, .L, .R, .NL, .NR, .lightOn);
	
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
		reset <= 1;												  @(posedge clk);
		reset <= 0; L <= 0;	R <= 0;	NL <= 0; NR <= 0;@(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
						L <= 0;	R <= 0;	NL <= 0; NR <= 1;@(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
						L <= 0;	R <= 0;	NL <= 1; NR <= 0;@(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
						L <= 0;	R <= 0;	NL <= 1; NR <= 1;@(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
						L <= 0;	R <= 1;	NL <= 0; NR <= 0;@(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
						L <= 0;	R <= 1;	NL <= 0; NR <= 1;@(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
						L <= 0;	R <= 1;	NL <= 1; NR <= 0;@(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
						L <= 0;	R <= 1;	NL <= 1; NR <= 1;@(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
						L <= 1;	R <= 0;	NL <= 0; NR <= 0;@(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
						L <= 1;	R <= 0;	NL <= 0; NR <= 1;@(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
						L <= 1;	R <= 0;	NL <= 1; NR <= 0;@(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
						L <= 1;	R <= 0;	NL <= 1; NR <= 1;@(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
						L <= 1;	R <= 1;	NL <= 0; NR <= 0;@(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
						L <= 1;	R <= 1;	NL <= 0; NR <= 1;@(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
						L <= 1;	R <= 1;	NL <= 1; NR <= 0;@(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
						L <= 1;	R <= 1;	NL <= 1; NR <= 1;@(posedge clk);
						L <= 1;	R <= 0;	NL <= 0; NR <= 0;@(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
																	  


		$stop;
	end
endmodule