module I_O (clk, reset, key0, key3, L, R);
input logic clk, reset;
input key0, key3;
output L, R;

	key Left(.clk, .reset, .key(key3) , .press(L));
	key Right(.clk, .reset, .key(key0), .press(R));

endmodule