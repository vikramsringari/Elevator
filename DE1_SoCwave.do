onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /DE1_SoC_testbench/CLOCK_PERIOD
add wave -noupdate /DE1_SoC_testbench/HEX0
add wave -noupdate /DE1_SoC_testbench/HEX1
add wave -noupdate /DE1_SoC_testbench/HEX2
add wave -noupdate /DE1_SoC_testbench/HEX3
add wave -noupdate /DE1_SoC_testbench/HEX4
add wave -noupdate /DE1_SoC_testbench/HEX5
add wave -noupdate -expand /DE1_SoC_testbench/LEDR
add wave -noupdate /DE1_SoC_testbench/KEY
add wave -noupdate /DE1_SoC_testbench/dut/up_down/direction
add wave -noupdate -expand /DE1_SoC_testbench/dut/floor/floor
add wave -noupdate -expand /DE1_SoC_testbench/SW
add wave -noupdate /DE1_SoC_testbench/clk
add wave -noupdate /DE1_SoC_testbench/dut/reset
add wave -noupdate {/DE1_SoC_testbench/dut/clk[0]}
add wave -noupdate /DE1_SoC_testbench/dut/SW2
add wave -noupdate {/DE1_SoC_testbench/dut/clk[0]}
add wave -noupdate /DE1_SoC_testbench/dut/reset
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {12219 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 189
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {11642 ps} {12209 ps}
