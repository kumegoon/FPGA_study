#! /bin/csh -f
source /user1/cae_admin/com/msim_v6.4c.csh
vcom decorder.vhd
vlog decorder_tb.v
vsim decorder_tb.v
