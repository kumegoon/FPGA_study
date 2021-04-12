#! /bin/csh
source /user1/cae_admin/com/msim_v6.4c.csh
vcom sync.vhd
vlog sync_tb.v
vsim sync_tb.v
