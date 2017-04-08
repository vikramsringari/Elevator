module DE1_SoCa (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
		output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
		output logic [9:0] LEDR;
		input logic [3:0] KEY;
		input logic [9:0] SW;
		assign HEX2 = 7'b1111111;
		assign HEX3 = 7'b1111111;
		assign HEX4 = 7'b1111111;
		assign HEX5 = 7'b1111111;
		seg7 m1(.bcd(SW[3:0]),.leds(HEX0));
		seg7 m2(.bcd(SW[7:4]),.leds(HEX1));
endmodule

module DE1_SoCa_testbench();
	logic  [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	logic  [9:0] LEDR;
	logic  [3:0] KEY;
	logic  [9:0] SW;
		
	DE1_SoCa dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR, .SW);

	// Try all combinations of inputs.
	integer i;
	initial begin
		SW[9:8] = 1'b0;
		for(i = 0; i < 10; i++) begin
			SW[3:0] = i; #10;
			SW[7:4] = i; #10;
		end
	end
endmodule