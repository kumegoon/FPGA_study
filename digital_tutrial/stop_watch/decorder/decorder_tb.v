`define cycle 		1000
`define cycle_duty	`cycle/2
`define max_cycle_count	10000
`timescale		1ns/1ns


// module declare

module decorder_tb;
	reg[3:0]	DATA_IN;
	wire[6:0]	DATA_OUT;

	DECORDER DECORDER(
		.DATA_IN(DATA_IN),
		.DATA_OUT(DATA_OUT)
	);

// cycle set
	event	cycle_event;
	integer	cycle_count;

	initial	
		begin
			-> cycle_event;
			#1;
			cycle_count = 0;
		end

	always
		begin
			#(`cycle)
			-> cycle_event;
		end

	always @(cycle_event)
		begin
			cycle_count <= cycle_count + 1;
				if (cycle_count % 1000 == 0) begin
					$display ("%d cycle", cycle_count) ;
				end
		end

	initial
		begin
		#(`cycle);
			DATA_IN = 4'b1001;
		#(`cycle *1);
			DATA_IN = 4'b1000;
		#(`cycle *1);
			DATA_IN = 4'b0111;
		#(`cycle *1);
			DATA_IN = 4'b0110;
		#(`cycle *1);
			DATA_IN = 4'b0101;
		#(`cycle *1);
			DATA_IN = 4'b0100;
		#(`cycle *1);
			DATA_IN = 4'b0011;
		#(`cycle *1);
			DATA_IN = 4'b0010;
		#(`cycle *1);
			DATA_IN = 4'b0001;
		#(`cycle *1);
			DATA_IN = 4'b0000;
	
	#`max_cycle_count;
	$stop;
	end
endmodule
		