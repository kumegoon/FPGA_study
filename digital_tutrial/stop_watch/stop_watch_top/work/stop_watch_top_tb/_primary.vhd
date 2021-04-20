library verilog;
use verilog.vl_types.all;
entity stop_watch_top_tb is
    generic(
        CYCLE           : integer := 62500
    );
end stop_watch_top_tb;
