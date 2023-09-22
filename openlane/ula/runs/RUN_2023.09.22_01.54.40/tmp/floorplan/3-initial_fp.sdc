###############################################################################
# Created by write_sdc
# Fri Sep 22 01:54:48 2023
###############################################################################
current_design ula
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 10.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {en_in}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {op[0]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {op[1]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {op[2]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[0]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[10]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[11]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[12]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[13]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[14]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[15]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[1]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[2]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[3]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[4]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[5]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[6]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[7]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[8]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[9]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {result[15]}]
set_load -pin_load 0.0334 [get_ports {result[14]}]
set_load -pin_load 0.0334 [get_ports {result[13]}]
set_load -pin_load 0.0334 [get_ports {result[12]}]
set_load -pin_load 0.0334 [get_ports {result[11]}]
set_load -pin_load 0.0334 [get_ports {result[10]}]
set_load -pin_load 0.0334 [get_ports {result[9]}]
set_load -pin_load 0.0334 [get_ports {result[8]}]
set_load -pin_load 0.0334 [get_ports {result[7]}]
set_load -pin_load 0.0334 [get_ports {result[6]}]
set_load -pin_load 0.0334 [get_ports {result[5]}]
set_load -pin_load 0.0334 [get_ports {result[4]}]
set_load -pin_load 0.0334 [get_ports {result[3]}]
set_load -pin_load 0.0334 [get_ports {result[2]}]
set_load -pin_load 0.0334 [get_ports {result[1]}]
set_load -pin_load 0.0334 [get_ports {result[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {en_in}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {op[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {op[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {op[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_transition 0.7500 [current_design]
set_max_fanout 10.0000 [current_design]
