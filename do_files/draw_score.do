vlib work
vlog -timescale 1ns/1ns ../score_display.v
vsim draw_score
# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

force {clock} 0 0, 1 2 -repeat 4
force {reset} 0 0, 1 10
force {draw} 1 0, 0 500
force {input_x[7:0]} 10#130
force {input_y[6:0]} 10#20
force {map[59:0]} 2#111111100001100001100001111111001000001000001000001000001000 0

run 1000 ns