module key (clk, reset, key, press);
	input logic clk, reset, key;
	output logic press;
	logic key1, key2;
	
	enum { on, long, off } ps, ns;
	
	always_ff @(posedge clk)
         key1 <= key;
   always_ff @(posedge clk)//removing metastabillity
         key2 <= key1;

	always_comb begin
		case (ps)
			on:  
				ns = long; 
			long:
				if(key2)
					ns = long;
				else
					ns = off;
			off:
				if(key2)
					ns = on;
				else
					ns = off;
		endcase
		begin 
			if (ns == on)
				press = 1'b1;
			else if (ns == off)
				press = 1'b0;
			else if (ns == long)
				press = 1'b0;
			else 
				press = 1'bx;
		end

    // DFFs
   end
	
	always_ff @(posedge clk)
    	if (reset)
    	begin
			ps <= off;
			//ps <= off;
		end
        else 
        begin 
        	ps <= ns;
        	//ps <= key;
        end

endmodule

module key_testbench ();
	logic clk;
	logic reset;
	logic key;
	logic press;

	key dut (.clk, .reset, .key, .press);
	
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
									@(posedge clk);
		reset <= 1;					@(posedge clk);
		reset <= 0; key <= 1;   	@(posedge clk);
                           			@(posedge clk);
                           			@(posedge clk);
                           			@(posedge clk);
                    key <= 0;    @(posedge clk);
                    @(posedge clk);
                    key <= 1; @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    key <= 0; @(posedge clk);
						  @(posedge clk);

	$stop;
	end

endmodule