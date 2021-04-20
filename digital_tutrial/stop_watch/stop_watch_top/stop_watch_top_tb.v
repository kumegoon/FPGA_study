module stop_watch_top_tb;

// parameter define
parameter CYCLE 	= 62500;		// 62500ns
parameter HALF_CYCLE 	= CYCLE/2;	// 62500/2ns


reg	I_RSTN, I_CLK, I_EN1, I_EN2;
wire [9:0]	O_TIMER_MS;
wire [5:0]	O_TIMER_SEC;

stop_watch_top stop_watch_top(
	.I_CLK	(I_CLK),
	.I_RESN	(I_RSTN),
	.I_EN1 (I_EN1),
	.I_EN2 (I_EN2),
	.O_TIMER_MS (O_TIMER_MS),
	.O_TIMER_SEC (O_TIMER_SEC)
	);

always #(HALF_CYCLE) begin	
	I_CLK = ~I_CLK;
end

initial begin
	I_RSTN = 0;
	I_CLK=1;
        I_EN2 = 0;
   	#(10*CYCLE)
	I_RSTN = 1;
	I_EN1 = 1;
        #(1000*CYCLE)
        I_EN1 = 0;
        #(100*CYCLE)
        I_EN1= 1;
        #(1000*CYCLE)
        I_EN1=0;
        I_EN2=1;
        #(100*CYCLE)
        I_EN1=1;
        I_EN2=0;
        #(10000*CYCLE)
        I_RSTN=1;
        #(100*CYCLE)
          
        $finish;
   
end

endmodule