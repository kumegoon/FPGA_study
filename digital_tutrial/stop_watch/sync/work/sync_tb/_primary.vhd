library verilog;
use verilog.vl_types.all;
entity sync_tb is
    generic(
        CYCLE           : integer := 62500;
        HALF_CYCLE      : vl_notype;
        DELAY           : integer := 100
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CYCLE : constant is 1;
    attribute mti_svvh_generic_type of HALF_CYCLE : constant is 3;
    attribute mti_svvh_generic_type of DELAY : constant is 1;
end sync_tb;
