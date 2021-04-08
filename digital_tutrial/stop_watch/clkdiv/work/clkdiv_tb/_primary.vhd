library verilog;
use verilog.vl_types.all;
entity clkdiv_tb is
    generic(
        CYCLE           : integer := 62500;
        DELAY           : integer := 100
    );
end clkdiv_tb;
