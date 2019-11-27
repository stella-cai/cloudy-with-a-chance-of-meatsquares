vlib work
vlog -timescale 1ns/1ns ../catcher.v
vsim draw_catcher
# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

force {clock} 0 0, 1 2 -repeat 4

force {reset} 0 0, 1 10

force {draw} 1 0

force {position} 8'd60

run 2000 ns

