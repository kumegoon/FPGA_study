#! /bin/csh -f
source /user1/cae_admin/com/msim_v6.4c.csh
vcom clkdiv.vhd
vlog clkdiv_tb.v
vsim clkdiv_tb.v
