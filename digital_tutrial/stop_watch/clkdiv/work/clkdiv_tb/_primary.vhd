library verilog;
use verilog.vl_types.all;
entity clkdiv_tb is
    generic(
        CYCLE           : integer := 62500
    );
end clkdiv_tb;
