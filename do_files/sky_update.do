vlib work
vlog -timescale 1ns/1ns ../sky.v
vsim update_sky
# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

force {clock} 0 0, 1 2 -repeat 4
force {reset} 0 0, 1 10
force {delay_enable} 0 0, 1 5 -repeat 10

run 200 ns