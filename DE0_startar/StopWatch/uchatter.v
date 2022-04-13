module   unchatter(din, clk, dout);
    input din;
    input clk;
    output dout;
    reg [15:0] cnt;
    reg dff;

    //16bit Counter
    always @(posedge clk) begin
        cnt =cnt+1;
    end

    //switch latch
    always @(posedge cnt[15]) begin
        dff=din;
    end

    assign dout=dff;
endmodule