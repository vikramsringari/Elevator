module button (clk, reset, button, out);
	input logic clk, reset, button;
	output logic out;
	//reg ns, oldButton;
	
	//parameter on = 1'b1, off = 1'b0;
	
	enum { on, off } ps, ns;

	always_comb begin
		case (ps)
			on:  
				ns = off; 
			off:
				if(button & ps != ns)
					ns = on;
				else
					ns = off;
			default: ns = off;
		endcase
		begin 
			if (ns == on)
				out = 1'b1;
			else if (ns == off)
				out = 1'b0;
			else 
				out = 1'bx;
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
        	//ps <= button;
        end

endmodule

module button_testbench ();
	reg clk;
	reg reset;
	reg button;
	wire out;

	button dut (.clk, .reset, .button, .out);
	
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
		reset <= 0; button <= 1;   	@(posedge clk);
                           			@(posedge clk);
                           			@(posedge clk);
                           			@(posedge clk);
                    button <= 0;    @(posedge clk);
                    @(posedge clk);
                    button <= 1; @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    button <= 0; @(posedge clk);
                    @(posedge clk);
	$stop;
	end

endmodule