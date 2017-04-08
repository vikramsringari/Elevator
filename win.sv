module win (clk, reset, B, FL, OB, HEX, nextRound);
	input logic clk, reset;
	input logic B, FL, OB;
	output logic [6:0] HEX; 
	output logic nextRound;
	logic [2:0] counter;
	//old code
	/*enum { zero, one, two, three, four, five, six, seven } ps, ns;
	
	always_comb begin
		nextRound = ~(ps == ns);
	end
	
	always_comb begin
				case (ps)
					zero: 
						if (B & FL & ~OB)
							ns = one;
						else
							ns = zero;
					one:
						if (B & FL & ~OB)
							ns = two;
						else
							ns = one;
					two: 
						if (B & FL & ~OB)
							ns = three;
						else
							ns = two;
					three:
						if (B & FL & ~OB)
							ns = four;
						else
							ns = three;
					four:
						if (B & FL & ~OB)
							ns = five;
						else
							ns = four;
					five: 
						if (B & FL & ~OB)
							ns = six;
						else
							ns = five;
					six:
						if (B & FL & ~OB)
							ns = seven;
						else
							ns = six;
					seven:
						if (B & FL & ~OB)
							ns = seven;
						else
							ns = seven;
				endcase
		
		begin
			if(ns == zero)
				HEX = 7'b1000000;
			else if(ns == one)
				HEX = 7'b1111001;
			else if(ns == two)
				HEX = 7'b0100100;
			else if(ns == three)
				HEX = 7'b0110000;
			else if(ns == four)
				HEX = 7'b0011001;
			else if(ns == five)
				HEX = 7'b0010010;
			else if(ns == six)
				HEX = 7'b0000010;
			else if(ns == seven)
				HEX = 7'b1111000;
			else 
				HEX = 7'bx;
		end
	end
	
	    // DFFs
    always_ff @(posedge clk)
    	if (reset)
         ps <= zero;
      else 
        	ps <= ns;
	*/
		    // DFFs			 
	 always_comb begin
				case (counter)
					3'b000: HEX = 7'b1000000; 
					3'b001: HEX = 7'b1111001; 
					3'b010: HEX = 7'b0100100; 
					3'b011: HEX = 7'b0110000;
					3'b100: HEX = 7'b0011001;
					3'b101: HEX = 7'b0010010;
					3'b110: HEX = 7'b0000010;
					3'b111: HEX = 7'b1111000; 
					default: HEX = 7'bx;
				endcase
	 end
    always_ff @(posedge clk)
    	if (reset)
         counter <= 3'b000;
      else if ((B & FL & ~OB) & counter != 3'b111)
         begin
				counter <= counter + 1;
				nextRound = 1;
			end
		else
			begin
				counter <= counter;
				nextRound = 0;
			end

endmodule		
	
module win_testbench();
	logic clk, reset, B, FL, OB, nextRound;
	logic [6:0] HEX;
	
	win dut (.clk, .reset, .B, .FL, .OB, .HEX, .nextRound);
	
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
		reset <= 0; B <= 0;	OB <= 0;	FL <= 0; @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
						B <= 0;	OB <= 0;	FL <= 0; @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
						B <= 0;	OB <= 0;	FL <= 1; @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
						B <= 0;	OB <= 0;	FL <= 1; @(posedge clk);
																	  @(posedge clk);
																	  @(posedge clk);
						B <= 0;	OB <= 1;	FL <= 0; @(posedge clk);
																							  @(posedge clk);
																	  @(posedge clk);
						B <= 0;	OB <= 1;	FL <= 0; @(posedge clk);
																							  @(posedge clk);
																	  @(posedge clk);
						B <= 0;	OB <= 1;	FL <= 1; @(posedge clk);
																							  @(posedge clk);
																	  @(posedge clk);
						B <= 0;	OB <= 1;	FL <= 1; @(posedge clk);
																							  @(posedge clk);
																	  @(posedge clk);
						B <= 1;	OB <= 0;	FL <= 0; @(posedge clk);
																							  @(posedge clk);
																	  @(posedge clk);
						B <= 1;	OB <= 0;	FL <= 0; @(posedge clk);
																							  @(posedge clk);
																	  @(posedge clk);
						B <= 1;	OB <= 0;	FL <= 1; @(posedge clk);
																							  @(posedge clk);
																	  @(posedge clk);
						B <= 1;	OB <= 0;	FL <= 1; @(posedge clk);
																							  @(posedge clk);
																	  @(posedge clk);
						B <= 1;	OB <= 1;	FL <= 0; @(posedge clk);
																							  @(posedge clk);
																	  @(posedge clk);
						B <= 1;	OB <= 1;	FL <= 0; @(posedge clk);
																							  @(posedge clk);
																	  @(posedge clk);
						B <= 1;	OB <= 1;	FL <= 1; @(posedge clk);
																							  @(posedge clk);
																	  @(posedge clk);
						B <= 1;	OB <= 1;	FL <= 1; @(posedge clk);
																	  @(posedge clk);
		reset <= 0; B <= 0;	OB <= 0;	FL <= 0; @(posedge clk);
					B <= 1;	OB <= 0;	FL <= 0; @(posedge clk);
																							  @(posedge clk);
																	  @(posedge clk);
						B <= 1;	OB <= 0;	FL <= 0; @(posedge clk);
																							  @(posedge clk);
																	  @(posedge clk);
						B <= 1;	OB <= 0;	FL <= 1; @(posedge clk);
																							  @(posedge clk);
																	  @(posedge clk);
						B <= 1;	OB <= 0;	FL <= 1; @(posedge clk);
																							  @(posedge clk);
																	  @(posedge clk);
						B <= 1;	OB <= 1;	FL <= 0; @(posedge clk);
																							  @(posedge clk);
																	  @(posedge clk);
						B <= 1;	OB <= 1;	FL <= 0; @(posedge clk);
																							  @(posedge clk);
																	  @(posedge clk);
						B <= 1;	OB <= 1;	FL <= 1; @(posedge clk);
																							  @(posedge clk);
																	  @(posedge clk);
						B <= 1;	OB <= 1;	FL <= 1; @(posedge clk);
																	  @(posedge clk);
		
		$stop;
	end
endmodule
	