module floorDisplay (direction, floor, HEX0, HEX1, EAST, WEST, up_down);
	input logic [5:0] floor;
	input logic [1:0] direction;
	output logic [6:0] HEX0, HEX1;
	output logic EAST, WEST; 
	output logic [1:0] up_down;
	assign up_down = direction;
	
	always_comb begin
				case (floor)
						6'b000001: 
										begin
										HEX0 = 7'b1111111;
										HEX1 = 7'b1111001;
										EAST = 1'b1;
										WEST = 1'b1;
										end
						6'b000010: 
										begin
										HEX0 = 7'b1111111;
										HEX1 = 7'b0100100;
										EAST = 1'b1;
										WEST = 1'b0; 
										end
						6'b000100:
										begin
										HEX0 = 7'b0000110;
										HEX1 = 7'b0100100;
										EAST = 1'b0;
										WEST = 1'b1;
										end
						6'b001000:
										begin
										HEX0 = 7'b1111111;
										HEX1 = 7'b0110000;
										EAST = 1'b1;
										WEST = 1'b0;
										end
						6'b010000:
										begin
										HEX0 = 7'b0000110;
										HEX1 = 7'b0110000;
										EAST = 1'b0;
										WEST = 1'b1;
										end
						6'b100000:
										begin
										HEX0 = 7'b1111111;
										HEX1 = 7'b0011001;
										EAST = 1'b1;
										WEST = 1'b1;
										end
						default: 
										begin
										HEX0 = 7'b0000000;
										HEX1 = 7'b0000000;
										EAST = 1'bX;
										WEST = 1'bX;
										end

				endcase
	end
endmodule
module floorDisplay_testbench;
	logic [5:0] floor;
	logic [1:0] direction;
	logic [6:0] HEX0, HEX1;
	logic EAST, WEST; 
	logic [1:0] up_down;
	
	floorDisplay dut (.direction, .floor, .HEX0, .HEX1, .EAST, .WEST, .up_down);
		initial begin
				#10;direction = 2'b10; floor=6'b000001; 
				#10;direction = 2'b10; floor=6'b100000;
				#10;direction = 2'b01; floor=6'b100000;
				#10;direction = 2'b01; floor=6'b000001;
				#10;direction = 2'b00; floor=6'b001000;
		end

endmodule
