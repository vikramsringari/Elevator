# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./mux2_1.sv"
vlog "./DE1_SoC.sv"
vlog "./UPC7seg.sv"
vlog "./seg7.sv"
vlog "./DE1_SoCa.sv"
vlog "./simple.sv"
vlog "./HazardLights.sv"
vlog "./key.sv"
vlog "./game_play.sv"
vlog "./normalLight.sv"
vlog "./centerLight.sv"
vlog "./win.sv"
vlog "./I_O.sv"
vlog "./TenBitLFSR.sv"
vlog "./LFSR.sv"
vlog "./comparator.sv"
vlog "./clock_divider.sv"
vlog "./floorControl.sv"
vlog "./firstfloorLight.sv"
vlog "./floorLight.sv"
vlog "./direction.sv"
vlog "./floorCompare.sv"
vlog "./floorDisplay.sv"
# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work floorCompare_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do  floorCompare_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
