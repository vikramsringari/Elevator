module 10bitLFSR (clk, reset, dffwire)
	input logic clk, reset;
	output logic [9:0] dffwire;
	logic xnor_out;
	
	assign xnor_out = dffwire[9] ^ dffwire[6];
	
	LFSR q1 (clk, reset, xnor_out, dffwire[0]);
	LFSR q1 (clk, reset, dffwire[0], dffwire[1]);
	LFSR q1 (clk, reset, dffwire[1], dffwire[2]);
	LFSR q1 (clk, reset, dffwire[2], dffwire[3]);
	LFSR q1 (clk, reset, dffwire[3], dffwire[4]);
	LFSR q1 (clk, reset, dffwire[4], dffwire[5]);
	LFSR q1 (clk, reset, dffwire[5], dffwire[6]);
	LFSR q1 (clk, reset, dffwire[6], dffwire[7]);
	LFSR q1 (clk, reset, dffwire[7], dffwire[8]);
	LFSR q1 (clk, reset, dffwire[8], dffwire[9]);
endmodule
	

