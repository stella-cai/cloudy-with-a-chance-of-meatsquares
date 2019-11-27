vlib work
vlog -timescale 1ns/1ns ../catcher.v
vsim draw_catcher
# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

force {clock} 0 0, 1 1 -repeat 2
force {reset} 0 0, 1 10
force {position} 10#56
force {draw} 1 0

run 1200 ns