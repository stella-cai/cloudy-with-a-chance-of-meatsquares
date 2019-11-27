vlib work2

# Compile all Verilog modules in CSC258_lab2_verilog_part3.v to working dir;
# could also have multiple Verilog files.
# The timescale argument defines default time unit
# (used when no unit is specified), while the second number
# defines precision (all times are rounded to this value)
vlog -timescale 1ns/1ns CSC258_Project_version2/main.v

# Load simulation using mux as the top level simulation module.
vsim test_module

# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

force {resetn} 0
force {left} 0
force {right} 0
force {go} 0
force {CLOCK_50} 0 0ns 1 1ns
run 2ns
