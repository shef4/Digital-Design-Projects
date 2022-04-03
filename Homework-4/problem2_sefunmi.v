
module problem2_sefunmi(a,b,c,d,f);
	input a,b,c,d;
	output f;
	wire [2:0] bcd;
	wire [7:0] aor1or0;
	wire en,neg_a;
	assign en = 1'b1;
	assign neg_a = ~a;
	assign aor1or0 = {1'b1,a,neg_a,1'b1,1'b0,neg_a, a,1'b0};
	assign bcd = {b,c,d};
	mux8to1_sefunmi DUT1(en,bcd,aor1or0, f);
endmodule