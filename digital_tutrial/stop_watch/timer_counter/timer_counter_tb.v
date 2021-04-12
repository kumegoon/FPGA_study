module timer_counter_tb;

// parameter define
parameter CYCLE 	= 62500;		// 6.25us
parameter HALF_CYCLE 	= CYCLE/2;		// 6.25/2us
parameter MS_EN	= CYCLE*15;		// 1ms-1clk 
parameter SEC_FLAG_EN = CYCLE * 159999;	//1s-1clk
parameter DELAY = 100;

reg	I_RSTN, I_CLK, I_EN_1MS, I_CLEAR_EN, I_START_EN;
reg 	SEC_FLAG;
wire [9:0]	O_TIMER_MS;
wire [5:0]	O_TIMER_SEC;

timer_counter timer_counter(
	.I_CLK	(I_CLK),
	.I_RSTN	(I_RSTN),
	.I_EN_1MS (I_EN_1MS),
	.I_CLEAR_EN (I_CLEAR_EN),
	.I_START_EN (I_START_EN),
	.O_TIMER_MS (O_TIMER_MS),
	.O_TIMER_SEC (O_TIMER_SEC)
	);

always #(HALF_CYCLE) begin	
	I_CLK = ~I_CLK;
end

always begin
	I_EN_1MS = 1'b0;
	#MS_EN
	I_EN_1MS = 1'b1;
	#CYCLE
	I_EN_1MS = 1'b0;
end

always begin
	SEC_FLAG = 1'b0;
	#1000000000
	SEC_FLAG =  1'b1;
	#1000000000
	SEC_FLAG = 1'b0;
end

initial begin
	I_RSTN = 0;
	I_CLK=1;
	#DELAY
	I_RSTN = 1;
	I_START_EN = 1;
	#60000000000 $finish;
end

endmodule