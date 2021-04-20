onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal /timer_counter_tb/CYCLE
add wave -noupdate -format Literal /timer_counter_tb/HALF_CYCLE
add wave -noupdate -format Literal /timer_counter_tb/MS_EN
add wave -noupdate -format Literal /timer_counter_tb/SEC_FLAG_EN
add wave -noupdate -format Literal /timer_counter_tb/DELAY
add wave -noupdate -format Logic /timer_counter_tb/I_RSTN
add wave -noupdate -format Logic /timer_counter_tb/I_CLK
add wave -noupdate -format Logic /timer_counter_tb/I_EN_1MS
add wave -noupdate -format Logic /timer_counter_tb/I_CLEAR_EN
add wave -noupdate -format Logic /timer_counter_tb/I_START_EN
add wave -noupdate -format Logic /timer_counter_tb/SEC_FLAG
add wave -noupdate -format Literal /timer_counter_tb/O_TIMER_MS
add wave -noupdate -format Literal /timer_counter_tb/O_TIMER_SEC
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
WaveRestoreZoom {0 ns} {1 us}
