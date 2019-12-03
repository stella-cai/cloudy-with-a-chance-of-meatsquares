vlib work
vlog -timescale 1ns/1ns ../control.v
vsim control
# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

force {clock} 0 1, 1 1 -repeat 2
force {reset} 0 0, 1 10
force {start} 0 0, 1 15, 0 25
force {finish_game} 0 0
force {finish_drawing_squares} 0 0, 1 40, 0 45
force {finish_drawing_catcher} 0 0, 1 60, 0 65
force {delay_enable} 0 0, 1 80, 0 85
run 200 ns