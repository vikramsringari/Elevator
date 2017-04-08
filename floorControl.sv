module floorControl (clk, reset, direction, floorbutton, floor);
	input logic clk, reset;
	input logic [1:0] direction;
	input logic [5:0] floorbutton;//floorbutton
	output logic [5:0] floor;

	firstfloorLight floor1(.clk, .reset, .above(floor[1]), .below(1'b0), .direction, .floorbutton(floorbutton[0]), .floor(floor[0]));
	floorLight floor2(.clk, .reset, .above(floor[2]), .below(floor[0]), .direction, .floorbutton(floorbutton[1]), .floor(floor[1]));
	floorLight floor2M(.clk, .reset, .above(floor[3]), .below(floor[1]), .direction, .floorbutton(floorbutton[2]), .floor(floor[2]));
	floorLight floor3(.clk, .reset, .above(floor[4]), .below(floor[2]), .direction, .floorbutton(floorbutton[3]), .floor(floor[3]));
	floorLight floor3M(.clk, .reset, .above(floor[5]), .below(floor[3]), .direction, .floorbutton(floorbutton[4]), .floor(floor[4]));
	floorLight floor4(.clk, .reset, .above(1'b0), .below(floor[4]), .direction, .floorbutton(floorbutton[5]), .floor(floor[5]));
	

	
endmodule
module floorControl_testbench();
	logic clk, reset; 
	logic [1:0] direction;
	logic [5:0] floorbutton, floor;
	
	floorControl dut (.clk, .reset, .direction, .floorbutton, .floor);
	
	// Set up the clock
	parameter CLOCK_PERIOD = 100;
	initial clk = 1;
	always begin
		#(CLOCK_PERIOD / 2);
		clk = ~clk;
	end 
	
	initial begin
	reset	<= 0; direction[1:0] <= 2'b00; floorbutton[5:0]<=6'b000000; @(posedge clk);
								@(posedge clk);
	reset <= 1;				@(posedge clk);
								@(posedge clk);
	reset <= 0;				@(posedge clk);
								@(posedge clk);
	floorbutton[5:0]<=6'b100000; direction[1:0] <= 2'b10; @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
	direction[1:0] <= 2'b00;								  @(posedge clk);
	floorbutton[5:0]<=6'b000010;  direction[1:0] <= 2'b01;@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
	floorbutton[5:0]<=6'b100010;								@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
	floorbutton[5:0]<=6'b100000;								@(posedge clk);
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
																		@(posedge clk);
	direction[1:0] <= 2'b00;		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
	floorbutton[5:0]<=6'b001000; 	direction[1:0] <= 2'b10;@(posedge clk);		
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
		$stop;
	end
endmodule
	
