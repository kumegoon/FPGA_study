onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal /clkdiv_tb/CYCLE
add wave -noupdate -format Literal /clkdiv_tb/HALF_CYCLE
add wave -noupdate -format Logic /clkdiv_tb/I_RSTN
add wave -noupdate -format Logic /clkdiv_tb/I_CLK
add wave -noupdate -format Logic /clkdiv_tb/I_START_EN
add wave -noupdate -format Logic /clkdiv_tb/I_CLEAR_EN
add wave -noupdate -format Logic /clkdiv_tb/O_EN_1MS
add wave -noupdate -format Logic /clkdiv_tb/clkdiv/i_clk
add wave -noupdate -format Logic /clkdiv_tb/clkdiv/i_rstn
add wave -noupdate -format Logic /clkdiv_tb/clkdiv/i_clear_en
add wave -noupdate -format Logic /clkdiv_tb/clkdiv/i_start_en
add wave -noupdate -format Logic /clkdiv_tb/clkdiv/o_en_1ms
add wave -noupdate -format Logic /clkdiv_tb/clkdiv/en_1ms_reg
add wave -noupdate -format Logic /clkdiv_tb/clkdiv/en_1ms_w
add wave -noupdate -format Literal /clkdiv_tb/clkdiv/counter_1ms_buf3
add wave -noupdate -format Literal /clkdiv_tb/clkdiv/counter_1ms_buf2
add wave -noupdate -format Literal /clkdiv_tb/clkdiv/counter_1ms_buf1
add wave -noupdate -format Literal /clkdiv_tb/clkdiv/counter_1ms_reg
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
