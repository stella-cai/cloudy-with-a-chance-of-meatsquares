vlib work2

# Compile all Verilog modules in CSC258_lab2_verilog_part3.v to working dir;
# could also have multiple Verilog files.
# The timescale argument defines default time unit
# (used when no unit is specified), while the second number
# defines precision (all times are rounded to this value)
vlog -timescale 1ns/1ns control.v

# Load simulation using mux as the top level simulation module.
vsim control

# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

force {reset} 0
force {start} 0
force {delay_enable} 0
force {finish_game} 0
force {finish_drawing_squares} 0
force {finish_drawing_catcher} 0
force {clock} 0 0ns, 1 1ns
run 2ns

force {reset} 1
force {start} 1 0ns, 0 1ns
force {delay_enable} 1
force {finish_game} 0
force {finish_drawing_squares} 1
force {finish_drawing_catcher} 0
force {clock} 0 0ns, 1 1ns -repeat 2ns
run 50ns