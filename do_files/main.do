vlib work
vlog -timescale 1ns/1ns ../main.v
vsim main
# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

force {CLOCK_50} 0 0, 1 2 -repeat 4
force {KEY[0]} 0 0, 1 10
force {KEY[1]} 0 0, 1 20, 0 30

run 10000 ns