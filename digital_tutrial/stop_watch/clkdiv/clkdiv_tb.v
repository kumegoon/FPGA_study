module clkdiv_tb;

// parameter define
parameter CYCLE 	= 62500;		// 0.0625us
parameter HALF_CYCLE 	= CYCLE/2;		// 0.0625/2us 
parameter DELAY = 100;

reg	I_RSTN, I_CLK;
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
	I_CLK=0;
	I_CLEAR_EN = 0;
	I_START_EN = 0;
	#100
	I_RSTN = 1;
	I_START_EN = 1;
	#100
	I_CLEAR_EN = 1;
	#110
	I_CLEAR_EN = 0;
	#120
	I_CLEAR_EN = 1;
	#(100*CYCLE) $finish;
end

endmodule