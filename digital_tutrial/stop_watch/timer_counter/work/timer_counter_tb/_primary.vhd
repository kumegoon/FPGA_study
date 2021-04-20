library verilog;
use verilog.vl_types.all;
entity timer_counter_tb is
    generic(
        CYCLE           : integer := 62500
    );
end timer_counter_tb;
