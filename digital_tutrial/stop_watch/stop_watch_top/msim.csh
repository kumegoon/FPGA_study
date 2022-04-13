#! /bin/csh
source /user1/cae_admin/com/msim_v6.4c.csh
vcom -f rtl.list
vlog stop_watch_top_tb.v
vsim stop_watch_top_tb.v
