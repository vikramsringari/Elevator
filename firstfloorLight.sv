module firstfloorLight(clk, reset, above, below, direction, floorbutton, floor);
	input logic clk, reset;
	input logic floorbutton;
	input logic [1:0] direction;
	input logic above, below;
	output logic floor;

	enum { on, off } ps, ns;
	
	always_comb begin
		floor = (ps == on & ~above & ~below);
	end

	always_comb begin
		case (ps)
			on: 	if (floorbutton | (direction == 2'b00 & ~floorbutton))
						ns = on;
					else    
						ns = off;
			off:	if (direction == 2'b01 & above)  
						ns = on;
			    	else 	
						ns = off;
		endcase

	end
		
    // DFFs
    always_ff @(posedge clk)
    	if (reset)
         ps <= on;
      else 
        	ps <= ns;
	
	
endmodule
module firstfloorfloorLight_testbench();
	logic clk, reset;
	logic floorbutton;
	logic [1:0] direction;
	logic above, below;
	logic floor;
	
	firstfloorLight dut (.clk, .reset, .above, .below, .direction, .floorbutton, .floor);
	
	// Set up the clock
	parameter CLOCK_PERIOD = 100;
	initial clk = 1;
	always begin
		#(CLOCK_PERIOD / 2);
		clk = ~clk;
	end 
	
	initial begin
	reset	<= 0; direction[1:0] <= 2'b00; floorbutton<=1'b0; above <= 1'b0; below <= 1'b1;@(posedge clk);
								@(posedge clk);
	reset <= 1;				@(posedge clk);
								@(posedge clk);
	reset <= 0;				@(posedge clk);
								@(posedge clk);
	floorbutton<=1'b1; direction[1:0] <= 2'b10; @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
	above <= 1'b1;																  @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
	direction[1:0] <= 2'b00;								  @(posedge clk);
	  direction[1:0] <= 2'b01;@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
	floorbutton<=1'b0;								@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
	above <=1'b0; below <= 1'b1;																	@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
	floorbutton<=6'b1;								@(posedge clk);
																			@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																																				@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
	above <=1'b1; below <= 1'b0;																	@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																																				@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																																				@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
	above <=1'b1; below <= 1'b0;																	@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
	direction[1:0] <= 2'b00;		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
	floorbutton<=1'b1; 	direction[1:0] <= 2'b10;@(posedge clk);		
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
	above <=1'b1; below <= 1'b0;										@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
		$stop;
	end
endmodule
	
