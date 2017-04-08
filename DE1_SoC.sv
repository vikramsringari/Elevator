module DE1_SoC (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	input logic CLOCK_50; // 50MHz clock.
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output logic [9:0] LEDR;
	input logic [3:0] KEY; // True when not pressed, False when pressed
	input logic [9:0] SW;
	logic[9:0] SW1, SW2;
	 
	assign HEX2 = 7'b1111111;
	assign HEX3 = 7'b1111111;
	assign HEX4 = 7'b1111111;
	
	logic [31:0] clk;
	parameter whichClock = 24;
	clock_divider cdiv (.clock(CLOCK_50), .divided_clocks(clk));
	
	always_ff @(posedge clk[whichClock])
         SW1 <= SW;
   always_ff @(posedge clk[whichClock])//removing metastabillity
         SW2 <= SW1;
			

			
	logic reset; 
	logic [1:0] direction;
	logic [5:0] currentFloor;
	assign reset = SW2[9];
	direction up_down(.clk(clk[whichClock]), .reset, .nextFloor(SW2[5:0]), .currentFloor, .direction);
	floorControl floor(.clk(clk[whichClock]), .reset, .direction, .floorbutton(SW2[5:0]), .floor(currentFloor));
	floorDisplay display(.direction, .floor(currentFloor), .HEX0, .HEX1, .EAST(LEDR[7]), .WEST(LEDR[6]), .up_down(LEDR[9:8]));
	numberFloor n(.floor(SW2[5:0]), .HEX6(HEX5));
	
	
	

endmodule

// divided_clocks[0] = 25MHz, [1] = 12.5Mhz, ... [23] = 3Hz, [24] = 1.5Hz,
module clock_divider (clock, divided_clocks);
 input logic clock;
 output logic [31:0] divided_clocks;

 initial
	divided_clocks <= 1;

 always_ff @(posedge clock)
 divided_clocks <= divided_clocks + 1;
endmodule 


module DE1_SoC_testbench();
	logic 	   [6:0]	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	logic     [9:0] LEDR;
	logic      [3:0] KEY;
	logic      [9:0] SW;
	logic      clk;
	
	DE1_SoC dut (.CLOCK_50(clk), .HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR, .SW);
	
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
		SW[9:0] <= 10'b000000000;												@(posedge clk);
		SW[9]  <= 1; 					 			@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
		SW[9]  <= 0; 					 			@(posedge clk);
		SW[5] <= 1;				 				@(posedge clk);
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
		SW[5] <= 0;								@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
		SW[2] <= 1;								@(posedge clk);
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
		SW[4] <= 1;	SW[0] <=1;					@(posedge clk);
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
				SW[2] <= 0;											@(posedge clk);
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
				SW[4] <= 0;	SW[0] <=0;										@(posedge clk);
				SW[1] <= 1;																					@(posedge clk);
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
				SW[1] <= 0;										@(posedge clk);
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
				SW[4] <= 1; SW[1] <= 1;										@(posedge clk);
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
				SW[1] <= 0;										@(posedge clk);
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
									
		
			$stop;
		end
	endmodule  