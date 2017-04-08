module UPC7seg (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, SW);
 	output logic [6:0]	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	input	 logic[9:7]		SW;
	logic         [6:0]  zero, P, H, o, n, E, A, d, F, r,  L, one, seven, six, g;
	
	assign zero = 7'b1111111;
	assign P   = 7'b0001100;
	assign H   = 7'b0001001;
	assign o   = 7'b0100011;
	assign n   = 7'b0101011;
	assign E   = 7'b0000110;
	assign A   = 7'b0001000;
	assign d   = 7'b0100001;
	assign F   = 7'b0001110;
	assign r   = 7'b0101111;
	assign L   = 7'b1000111;
	assign one   = 7'b1111001;
	assign seven = 7'b1111000;
	assign six = 7'b0000010;
	assign g = 7'b1000010;

	always_comb
		case (SW)
			3'b000: 
						begin 
							// Phones
							HEX5 = zero;
							HEX4 = P;
							HEX3 = H;
							HEX2 = o;
							HEX1 = n;
							HEX0 = E;
						end
			3'b001: 
						begin 
							// Fred Dolls
							HEX5 = zero;
							HEX4 = zero;
							HEX3 = F;
							HEX2 = r;
							HEX1 = E;
							HEX0 = d;
						end
			3'b011: 
						begin 
							// Rubber Hands
							HEX5 = zero;
							HEX4 = zero;
							HEX3 = H;
							HEX2 = A;
							HEX1 = n;
							HEX0 = d;
						end
			3'b100: 
						begin 
							// Jumbo Jet Planes
							HEX5 = zero;
							HEX4 = P;
							HEX3 = L;
							HEX2 = A;
							HEX1 = n;
							HEX0 = E;
						end
			3'b101: 
						begin 
							// 1776 American Revolutionary artifacts
							HEX5 = zero;
							HEX4 = zero;
							HEX3 = one;
							HEX2 = seven;
							HEX1 = seven;
							HEX0 = six;
						end
			3'b110: 
						begin 
							// Dog Food
							HEX5 = zero;
							HEX4 = zero;
							HEX3 = zero;
							HEX2 = d;
							HEX1 = o;
							HEX0 = g;
						end
						
			default:  begin 
							HEX5 = 7'bX;
							HEX4 = 7'bX;
							HEX3 = 7'bX;
							HEX2 = 7'bX;
							HEX1 = 7'bX;
							HEX0 = 7'bX;
						end
		endcase
endmodule

module UPC7seg_testbench();
	logic   [6:0]	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	logic   [9:7] SW;
	
	UPC7seg dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .SW);
	
	integer i;
	initial	begin
		for (i = 0; i < 8; i++) begin
			SW[9:7] = i; #10;
		end
	end
endmodule