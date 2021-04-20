onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal /sync_tb/CYCLE
add wave -noupdate -format Literal /sync_tb/HALF_CYCLE
add wave -noupdate -format Literal /sync_tb/DELAY
add wave -noupdate -format Logic /sync_tb/I_RSTN
add wave -noupdate -format Logic /sync_tb/I_CLK
add wave -noupdate -format Logic /sync_tb/I_START_EN
add wave -noupdate -format Logic /sync_tb/I_CLR_EN
add wave -noupdate -format Logic /sync_tb/O_START_EN
add wave -noupdate -format Logic /sync_tb/O_CLR_EN
add wave -noupdate -format Logic /sync_tb/sync/o_start_en
add wave -noupdate -format Logic /sync_tb/sync/o_clr_en
add wave -noupdate -format Logic /sync_tb/sync/start_en1_reg
add wave -noupdate -format Logic /sync_tb/sync/start_en2_reg
add wave -noupdate -format Logic /sync_tb/sync/start_en1_equal_en2_w
add wave -noupdate -format Logic /sync_tb/sync/start_buf1_w
add wave -noupdate -format Logic /sync_tb/sync/start_buf1_reg
add wave -noupdate -format Logic /sync_tb/sync/start_buf2_reg
add wave -noupdate -format Logic /sync_tb/sync/start_up_edge_w
add wave -noupdate -format Logic /sync_tb/sync/start_en_buf
add wave -noupdate -format Logic /sync_tb/sync/start_en_reg
add wave -noupdate -format Logic /sync_tb/sync/start_up_edge_reg
add wave -noupdate -format Logic /sync_tb/sync/clear_en1_reg
add wave -noupdate -format Logic /sync_tb/sync/clear_en2_reg
add wave -noupdate -format Logic /sync_tb/sync/clear_en_w
add wave -noupdate -format Logic /sync_tb/sync/clear_buf_w
add wave -noupdate -format Logic /sync_tb/sync/clear_out_buf_w
add wave -noupdate -format Logic /sync_tb/sync/clear_en_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ns} {1312559 ns}
