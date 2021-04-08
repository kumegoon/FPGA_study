onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal /clkdiv_tb/CYCLE
add wave -noupdate -format Literal /clkdiv_tb/HALF_CYCLE
add wave -noupdate -format Literal /clkdiv_tb/DELAY
add wave -noupdate -format Logic /clkdiv_tb/I_RSTN
add wave -noupdate -format Logic /clkdiv_tb/I_CLK
add wave -noupdate -format Logic /clkdiv_tb/O_EN_1MS
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {99 ns} 0} {{Cursor 2} {329 ns} 0}
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
WaveRestoreZoom {84 ns} {405 ns}
