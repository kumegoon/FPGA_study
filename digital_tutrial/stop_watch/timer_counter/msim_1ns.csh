#! /bin/csh
source /user1/cae_admin/com/msim_v6.4c.csh
vcom timer_counter.vhd
vlog timer_counter_tb.v
vsim timer_counter_tb.v
