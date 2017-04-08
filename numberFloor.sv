module numberFloor (floor, HEX6);
	input logic [6:0] floor;
	output logic [6:0] HEX6;
	logic [2:0] count;
   assign count = floor[0]+floor[1]+floor[2]+floor[3]+floor[4]+floor[5];
	always_comb begin
				case (count)
					3'b000:
						HEX6 = 7'b1000000;
					3'b001:
						HEX6 = 7'b1111001;
					3'b010:
						HEX6 = 7'b0100100;
					3'b011:
						HEX6 = 7'b0110000;
					3'b100:
						HEX6 = 7'b0011001;
					3'b101:
						HEX6 = 7'b0010010;
					3'b110:
						HEX6 = 7'b0000010;
					default:
						HEX6 = 7'b0000000;
				endcase
	end
endmodule

module numberFloor_testbench;
	logic [6:0] floor;
	logic [6:0] HEX6;
	numberFloor dut (.floor, .HEX6);
		initial begin
				#10;floor = 6'b100000; 
				#10;floor = 6'b101010;
				#10;floor = 6'b100001; 
				#10;floor = 6'b101111; 
				#10;floor = 6'b101001; 
		end

endmodule
	
