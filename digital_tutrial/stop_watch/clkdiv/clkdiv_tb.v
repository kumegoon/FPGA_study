module clkdiv_tb;

// parameter define
parameter CYCLE 	= 62500;		// 0.0625us
parameter HALF_CYCLE 	= CYCLE/2;		// 0.0625/2us 


reg	I_RSTN, I_CLK, I_START_EN, I_CLEAR_EN;
wire	O_EN_1MS;

clkdiv clkdiv(
	.I_CLK	(I_CLK),
	.I_RSTN	(I_RSTN),
	.I_CLEAR_EN (I_CLEAR_EN),
	.I_START_EN (I_START_EN),
	.O_EN_1MS (O_EN_1MS)
	);

always #(HALF_CYCLE) begin	
	I_CLK = ~I_CLK;
end

initial begin
	I_RSTN = 0;
	I_CLK=1;
	I_CLEAR_EN = 0;
	I_START_EN = 0;
	#(10*CYCLE)
	I_RSTN = 1;
	I_START_EN = 1;
	#(16*CYCLE)
	I_CLEAR_EN = 1;
	#(20*CYCLE)
	I_CLEAR_EN = 0;
	#(60*CYCLE)
	I_CLEAR_EN = 1;
	#(15*CYCLE) $finish;
end

endmodule