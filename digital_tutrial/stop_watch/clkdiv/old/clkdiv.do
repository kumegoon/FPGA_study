#///// SAMPLE FILE /////
restart -f
#///////////////////////
force -deposit  /I_CLK          1       31 -repeat 100
force -deposit  /I_CLK          0       31 -repeat 100
run 1000
force -deposit  /I_RSTN          0
run 10
force -deposit  /I_RSTN          1
run 10000

