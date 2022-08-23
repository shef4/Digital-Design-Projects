
module shifter_sefunmi(opcode, A, B, Result);
	input  [3:0]  opcode;
	input  [7:0]  A;
	input  [3:0]  B;
	output [15:0] Result;
	wire   [15:0]  cs_a, as_a;
	
	
	assign cs_a = {{8{1'b0}},A};
	assign as_a = {{8{A[7]}},A};
	assign a_as_r = (as_a >> B) || {as_a[15],{15{1'b0}}};
	assign Result =	(opcode == 4'h8) ? (cs_a << B) | (cs_a >> (16-B))	:
							(opcode == 4'h9) ? (cs_a >> B) | (cs_a << (16-B))	:
							(opcode == 4'h9) ? a_as_r									:
							(opcode == 4'hb) ? as_a << B								:16'bx;

endmodule
