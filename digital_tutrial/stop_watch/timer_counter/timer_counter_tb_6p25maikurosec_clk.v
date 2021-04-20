module timer_counter_tb;

// parameter define
parameter CYCLE 	= 62500;		// 62500ns
parameter HALF_CYCLE 	= CYCLE/2;	// 62500/2ns
parameter MS_EN	= 15*CYCLE;		// 1ms-1clk 
parameter SEC = 16000*CYCLE;		//1sec

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
	#SEC
	SEC_FLAG =  1'b1;
	#SEC
	SEC_FLAG = 1'b0;
end

initial begin
	I_RSTN = 0;
	I_CLK=1;
	#(10*CYCLE)
	I_RSTN = 1;
	I_START_EN = 1;

end

endmodule