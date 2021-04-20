library verilog;
use verilog.vl_types.all;
entity sync_tb is
    generic(
        CYCLE           : integer := 62500;
        DELAY           : integer := 100
    );
end sync_tb;
