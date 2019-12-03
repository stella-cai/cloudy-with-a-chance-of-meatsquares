vlib work
vlog -timescale 1ns/1ns ../sky.v
vsim sky
# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

force {clock} 0 0, 1 2 -repeat 4
force {reset} 0 0, 1 10
force {update} 0 0, 1 10 -repeat 20
force {draw} 1 0

run 2000 ns