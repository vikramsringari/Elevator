module direction (clk, reset, nextFloor, currentFloor, direction);
input logic clk, reset;
input logic [5:0] nextFloor, currentFloor;
output logic [1:0] direction;
logic greater, lesser, equal;
	enum { up, down, na } ps, ns;
	floorCompare c (.A(nextFloor), .B(currentFloor), .greater, .lesser, .equal); 

	always_comb begin
		case (ps)
			na: 	if (greater & ~lesser & ~equal & nextFloor != 6'b000000) 
						ns = up;
					else if((lesser & ~equal & nextFloor != 6'b000000)) 
						ns = down;
					else
						ns = na;
			up:	if (equal | nextFloor == 6'b000000 | currentFloor == 6'b100000)  
						ns = na;
			    	else 	
						ns = up;
			down:	if (equal | nextFloor == 6'b000000 | currentFloor == 6'b000001)  
						ns = na;
			    	else 	
						ns = down;
		endcase
		begin
			 if(ns == up)
					direction = 2'b10;
			 else if(ns == down)
					direction = 2'b01;
		    else if(ns == na)
					direction = 2'b00;
			 else 
					direction = 2'bX;
		 end
	end
	
	always_ff @(posedge clk)
		 begin 
			  if (reset)
				 ps <= na;
			  else
				 ps <= ns;
		  end
endmodule
module direction_testbench();
	logic clk, reset; 
	logic [1:0] direction;
	logic [5:0] nextFloor, currentFloor;
	
	direction dut (.clk, .reset, .nextFloor, .currentFloor, .direction);
	
	// Set up the clock
	parameter CLOCK_PERIOD = 100;
	initial clk = 1;
	always begin
		#(CLOCK_PERIOD / 2);
		clk = ~clk;
	end 
	
	initial begin
	reset	<= 0; nextFloor[5:0] <= 6'b000000; currentFloor[5:0]<=6'b000000; @(posedge clk);
								@(posedge clk);
	reset <= 1;				@(posedge clk);
								@(posedge clk);
	reset <= 0;				@(posedge clk);
								@(posedge clk);
	nextFloor[5:0] <= 6'b100000; @(posedge clk);
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
	currentFloor[5:0] <= 6'b100000;@(posedge clk);
	nextFloor[5:0] <= 6'b000000; @(posedge clk);
	nextFloor[5:0] <= 6'b000010;							  @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
	nextFloor[5:0]<=6'b100010;								@(posedge clk);
	currentFloor[5:0] <= 6'b000010;					   @(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
	nextFloor[5:0]<=6'b000000;																	@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
	nextFloor[5:0]<=6'b000010;		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
	
		$stop;
	end
endmodule
	
