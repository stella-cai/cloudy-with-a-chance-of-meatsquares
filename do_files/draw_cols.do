vlib work
vlog -timescale 1ns/1ns ../sky.v
vsim draw_cols
# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

force {clock} 0 0, 1 2 -repeat 4
force {reset} 0 0, 1 10
force {col1[27:0]} 2#0011001100110000001000001100
force {col3[27:0]} 2#0011001100110000001000001100
force {col2[27:0]} 2#0000001100111000000000001100
force {col4[27:0]} 2#0011001100110000001000001100

force {draw} 1 0, 0 30


run 2600 ns