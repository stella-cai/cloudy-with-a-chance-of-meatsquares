vlib work
vlog -timescale 1ns/1ns ../score_display.v
vsim draw_score
# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

force {clock} 0 0, 1 2 -repeat 4
force {reset} 0 0, 1 10
force {draw} 1 0
force {input_x[7:0]} 10#125
force {input_x2[7:0]} 10#150
force {input_y[6:0]} 10#20
force {map[59:0]} 2#111111100001100001100001111111100000100000100000100000111111 0
force {lives_map[29:0]} 2#100000100000100000100000111111 0

run 1000 ns