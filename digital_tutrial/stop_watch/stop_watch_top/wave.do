onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider TOP
add wave -noupdate -format Logic /stop_watch_top_tb/stop_watch_top/i_en1
add wave -noupdate -format Logic /stop_watch_top_tb/stop_watch_top/i_en2
add wave -noupdate -format Logic /stop_watch_top_tb/stop_watch_top/i_clk
add wave -noupdate -format Logic /stop_watch_top_tb/stop_watch_top/i_resn
add wave -noupdate -format Literal /stop_watch_top_tb/stop_watch_top/o_timer_ms
add wave -noupdate -format Literal /stop_watch_top_tb/stop_watch_top/o_timer_sec
add wave -noupdate -divider SYNC
add wave -noupdate -format Logic /stop_watch_top_tb/stop_watch_top/u_sync/i_start_en
add wave -noupdate -format Logic /stop_watch_top_tb/stop_watch_top/u_sync/i_clr_en
add wave -noupdate -format Logic /stop_watch_top_tb/stop_watch_top/u_sync/o_start_en
add wave -noupdate -format Logic /stop_watch_top_tb/stop_watch_top/u_sync/o_clr_en
add wave -noupdate -divider CLKDIV
add wave -noupdate -format Logic /stop_watch_top_tb/stop_watch_top/u_clkdiv/i_clk
add wave -noupdate -format Logic /stop_watch_top_tb/stop_watch_top/u_clkdiv/o_en_1ms
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
configure wave -namecolwidth 395
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {4699 ns}
