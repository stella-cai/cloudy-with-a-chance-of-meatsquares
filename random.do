vlib work
<<<<<<< HEAD
vlog -timescale 1ns/1ns random.v
=======
vlog -timescale 1ns/1ns datapath.v
>>>>>>> 02ecd957c9fbee3e9c1f953b9cd5afe1bccbb696
vsim random
# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

force {clock} 0 0, 1 2 -repeat 4
force {reset} 0 0, 1 10

run 200 ns