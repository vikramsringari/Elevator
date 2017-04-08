module seg7 (bcd, leds);
	input logic [3:0] bcd;
	output logic [6:0] leds;
	
	always_comb
		case (bcd)
			//          Light: 6543210
			4'b0000: leds = 7'b1000000; // 0
			4'b0001: leds = 7'b1111001; // 1
			4'b0010: leds = 7'b0100100; // 2
			4'b0011: leds = 7'b0110000; // 3
			4'b0100: leds = 7'b0011001; // 4
			4'b0101: leds = 7'b0010010; // 5
			4'b0110: leds = 7'b0000010; // 6
			4'b0111: leds = 7'b1111000; // 7
			4'b1000: leds = 7'b0000000; // 8
			4'b1001: leds = 7'b0010000; // 9
			default: leds = 7'bX;
		endcase
endmodule

module seg7_testbench();
	logic  [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	logic  [9:0] LEDR;
	logic  [3:0] KEY;
	logic  [9:0] SW;
	
	seg7 dut (SW[3:0], HEX0);

	integer i;
	initial begin
		SW[9:4] = 1'b0;
		for(i = 0; i < 16; i++) begin
			SW[3:0] = i; #10;
		end
	end
endmodule