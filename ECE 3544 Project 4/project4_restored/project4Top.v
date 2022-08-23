module project4Top(CLOCK_50, KEY, SW, LEDS, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
	input        CLOCK_50;
	input  [3:0] KEY;
	input  [9:0] SW;
	output [9:0] LEDS;
	output [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;

// INSTANTIATE THE MODULES THAT IMPLEMENT YOUR TOP LEVEL MODULE STARTING HERE.
   wire 				mode,action,stopgo;
	wire           carry_u001, carry_u010, carry_u100;
	wire				carry_m001, carry_m010, carry_m100;
	wire 	  [3:0]	state_u001, state_u010, state_u100,state_m001, state_m010, state_m100;
	wire	 [12:0]	state;
	reg 				count_u001, count_m001;
	reg 	  [3:0]	digit_u001, digit_u010, digit_u100, digit_m001, digit_m010, digit_m100;
// The top-level module instantiates two sub-modules - the buttonpressed and fsm16bit modules.
// The buttonpressed module maps KEY[0] to a one clock-period long enable pulse.
// The fsm16bit module uses the enable pulse and the switch inputs to determine its next synchronous state.
	buttonpressed 	RBP(CLOCK_50, 1'b1, KEY[3], reset);
	buttonpressed 	MBP(CLOCK_50, {~reset}, KEY[0], stopgo);
	buttonpressed 	ABP(CLOCK_50, {~reset}, KEY[1], action);
	buttonpressed 	SBP(CLOCK_50, {~reset}, KEY[2], mode);
	
	//stopwatch Fininte state machine
   fsm_sefunmi		FSM(CLOCK_50, {~reset}, {mode,action,stopgo}, state);
	
	assign LEDS[9:0] = {state[4:0],5'b00000};
	
	counter_clk_sefunmi U001(CLOCK_50, state[5], state[6], state[7], state[8], 4'b0000, state_u001, carry_u001);
	counter_clk_sefunmi U010(CLOCK_50, state[5], state[6], carry_u001, state[8], 4'b0000, state_u010, carry_u010);
	counter_clk_sefunmi U100(CLOCK_50, state[5], state[6], carry_u010, state[8], 4'b0000, state_u100, carry_u100);
	
	counter_clk_sefunmi M001(CLOCK_50, state[5], state[6], count_m001, state[8], 4'b0000, state_m001, carry_m001);
	counter_clk_sefunmi M010(CLOCK_50, state[5], state[6], carry_m001, state[8], 4'b0000, state_m010, carry_m010);
	counter_clk_sefunmi M100(CLOCK_50, state[5], state[6], carry_m010, state[8], 4'b0000, state_m100, carry_m100);
	
	always@(carry_u100 or state[9] or action or state_m001) begin
		if(state_m001 == 4'd9 && state_m010 == 4'd9 && state_m100 == 4'd9 && state[4:0] == 4'd12)begin	
			count_m001 <= 1'b0;
		end
		else if(state_u001 == 4'd0 && state_u010 == 4'd0 && state_u100 == 4'd0 & state_m001 == 4'd0 && state_m010 == 4'd0 && state_m100 == 4'd0 && state[8] == 4'd1)begin
			count_u001 <= 1'b0;
			count_m001 <= 1'b0;
		end
		else 	count_m001 <= carry_u100 | (state[9] & action);
   end
	
	always@(CLOCK_50 or state_u001 or state_u010 or state_u100 or state_m001 or state_m010 or state_m100) begin
		digit_u001 <= state_u001;
		digit_u010 <= state_u010;
		digit_u100 <= state_u100;
		digit_m001 <= state_m001;
		digit_m010 <= state_m010;
		digit_m100 <= state_m100;
   end
	
	//stopwatch state to output mapper: {watch_output => output_signals}
	hex_display   U001HD(digit_u001, HEX0);
	hex_display   U010HD(digit_u010, HEX1);
	hex_display   U100HD(digit_u100, HEX2);
	hex_display   M001HD(digit_m001, HEX3);
	hex_display   M010HD(digit_m010, HEX4);
	hex_display   M100HD(digit_m100, HEX5);
	
	
endmodule
