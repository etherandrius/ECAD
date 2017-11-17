
module rotary_hex (
	clk_clk,
	eightbitstosevenseg_0_led_pins_led0,
	eightbitstosevenseg_0_led_pins_led1,
	reset_reset_n,
	rotaryctl_0_rotary_event_rotary_cw,
	rotaryctl_0_rotary_event_rotary_ccw,
	rotaryctl_0_rotary_in_rotary_in);	

	input		clk_clk;
	output	[6:0]	eightbitstosevenseg_0_led_pins_led0;
	output	[6:0]	eightbitstosevenseg_0_led_pins_led1;
	input		reset_reset_n;
	output		rotaryctl_0_rotary_event_rotary_cw;
	output		rotaryctl_0_rotary_event_rotary_ccw;
	input	[1:0]	rotaryctl_0_rotary_in_rotary_in;
endmodule
