

module functionUnit_sefunmi(mult_clk,mult_en, opcode, A, B, Result);
	input         mult_clk, mult_en;
	input  [3:0]  opcode;
	input  [7:0]  A;
	input  [7:0]  B;
	output [15:0] Result;
	wire 	 [15:0] alu_result,shift_result, mult_result;
	wire   [1:0]  func;
	
	alu_sefunmi(opcode, A, B, alu_result);
	shifter_sefunmi(opcode, A, B[3:0], shift_result);
	seq_mult_sefunmi(mult_en, mult_clk, A, B, mult_result);
	
	assign Result = 	(opcode <= 4'h7 || (opcode >= 4'hd && opcode <= 4'hf)) ? 	alu_result		:
							(opcode <= 4'hb) 													 ? 	shift_result	:
							(opcode == 4'hc) 													 ? 	mult_result		:16'bx;
endmodule
