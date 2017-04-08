module HazardLights (clk, reset, SW, LEDR);
    input logic clk, reset;
    input logic [1:0] SW;
    output logic [2:0] LEDR;
	 logic [1:0] SW1;
	 logic [1:0] SW2;
	 
	 
	 enum { O, C, R, L } ps, ns;
	 
	always_ff @(posedge clk)
         SW1 <= SW;
   always_ff @(posedge clk)//removing metastabillity
         SW2 <= SW1; 

	 // Next State logic
	 always_comb begin
		 case (ps)
			 O: 
					  ns = C;
			 C: 
			    if (~SW2[1] & ~SW2[0]) 
					  ns = O;
			    else if (SW2[1] & ~SW2[0]) 
					  ns = R;
				 else
					  ns = L;
			 R: 

			    if (SW2[1] & ~SW2[0]) 
					  ns = L;
				 else
					  ns = C;
			 L: 
				 if (~SW2[1] & SW2[0])
					  ns = R;
				 else 
					  ns = C;
		 endcase
		 begin
			 if(ns == O)
					LEDR = 3'b101;
			 else if(ns == C)
					LEDR = 3'b010;
		    else if(ns == L)
					LEDR = 3'b100;
			 else if(ns == R)
					LEDR = 3'b001;
			 else 
					LEDR = 3'bX;
		 end	 		
	 end	
	 // DFFs
	 always_ff @(posedge clk)
		 begin 
			  if (reset)
				 ps <= C;
			  else
				 ps <= ns;
		  end

endmodule
module HazardLights_testbench();
	logic clk, reset; 
	logic [1:0] SW;
	logic [2:0] LEDR;
	parameter ClockDelay = 100;
	HazardLights dut (.clk, .reset, .SW, .LEDR); // Instantiate the D FF
	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	initial // Set up the reset signal
	begin
		reset <= 1;			  		  @(posedge clk); // 200
		reset <= 0; 				  @(posedge clk); // 300
					    SW <= 2'b00; @(posedge clk); // 400
										  @(posedge clk); // 500
										  @(posedge clk); // 600
					    SW <= 2'b01; @(posedge clk); // 700
										  @(posedge clk); // 800
										  @(posedge clk); // 900
										  @(posedge clk); // 1000
										  @(posedge clk); // 1100
					    SW <= 2'b10; @(posedge clk); // 1200
										  @(posedge clk); // 1300
										  @(posedge clk); // 1400
										  @(posedge clk); // 1500
										  @(posedge clk); // 1600
		$stop(); // end the simulation
	end
endmodule