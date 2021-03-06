
module decoder4to16_sefunmi(enable, dec_in, dec_out);
	input enable;
	input [3:0] dec_in;
	output [15:0] dec_out;
	wire [15:0] outs;

	assign outs = (dec_in == 4'b0000) ? 15'b0000000000000001 : 
		      (dec_in == 4'b0001) ? 15'b0000000000000010 :
		      (dec_in == 4'b0010) ? 15'b0000000000000100 :
		      (dec_in == 4'b0011) ? 15'b0000000000001000 :
		      (dec_in == 4'b0100) ? 15'b0000000000010000 :
		      (dec_in == 4'b0101) ? 15'b0000000000100000 :
		      (dec_in == 4'b0110) ? 15'b0000000001000000 : 
		      (dec_in == 4'b0111) ? 15'b0000000010000000 :
		      (dec_in == 4'b1000) ? 15'b0000000100000000 : 
		      (dec_in == 4'b1001) ? 15'b0000001000000000 :
		      (dec_in == 4'b1010) ? 15'b0000010000000000 :
		      (dec_in == 4'b1011) ? 15'b0000100000000000 :
		      (dec_in == 4'b1100) ? 15'b0001000000000000 :
		      (dec_in == 4'b1101) ? 15'b0010000000000000 :
		      (dec_in == 4'b1110) ? 15'b0100000000000000 : 
		      (dec_in == 4'b1111) ? 15'b1000000000000000 :
		      15'bxxxxxxxxxxxxxxx;
	assign dec_out = enable ? outs  : 15'b0000000000000000;
	endmodule
