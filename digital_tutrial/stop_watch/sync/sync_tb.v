module sync_tb;

// parameter define
parameter CYCLE 	= 62500;		// 6.25us
parameter HALF_CYCLE 	= CYCLE/2;		// 6.25us/2 
parameter DELAY = 100;

reg	I_RSTN, I_CLK, I_START_EN, I_CLR_EN;
wire	O_START_EN, O_CLR_EN;

sync sync(
	.I_START_EN  (I_START_EN),
	.I_CLR_EN    (I_CLR_EN),      
	.I_CLK	(I_CLK),
	.I_RSTN	(I_RSTN),
	.O_START_EN (O_START_EN),
	.O_CLR_EN   (O_CLR_EN)      
	);

always #(HALF_CYCLE) begin	
	I_CLK = ~I_CLK;
end

initial begin
	I_RSTN = 0;
	I_CLK=1;
        I_START_EN=0;
        I_CLR_EN=0;
   	#(10*CYCLE)
	I_RSTN = 1;
        #(1*CYCLE)
        I_START_EN = 1;
        #(5*CYCLE)
	I_START_EN = 0;
        I_CLR_EN =1;
        #(10*CYCLE)
        I_START_EN =1;
        #(10*CYCLE)
        I_START_EN = 0;
        I_CLR_EN =0;
	#(10*CYCLE)
        I_START_EN = 1;
	#(10*CYCLE)
        I_CLR_EN =1;
   
    	#(20*CYCLE) $finish;
end

endmodule
