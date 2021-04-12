library verilog;
use verilog.vl_types.all;
entity timer_counter_tb is
    generic(
        CYCLE           : real    := 6.250000;
        DELAY           : integer := 100
    );
end timer_counter_tb;
