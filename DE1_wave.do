onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /DE1_SoC_testbench/HEX0
add wave -noupdate /DE1_SoC_testbench/HEX1
add wave -noupdate /DE1_SoC_testbench/HEX2
add wave -noupdate /DE1_SoC_testbench/HEX3
add wave -noupdate /DE1_SoC_testbench/HEX4
add wave -noupdate /DE1_SoC_testbench/HEX5
add wave -noupdate -expand /DE1_SoC_testbench/LEDR
add wave -noupdate /DE1_SoC_testbench/KEY
add wave -noupdate /DE1_SoC_testbench/SW
add wave -noupdate /DE1_SoC_testbench/clk
add wave -noupdate /DE1_SoC_testbench/dut/reset
add wave -noupdate /DE1_SoC_testbench/dut/gp/LED5/ps
add wave -noupdate /DE1_SoC_testbench/dut/gp/LED5/ns
add wave -noupdate /DE1_SoC_testbench/dut/gp/LED7/ps
add wave -noupdate /DE1_SoC_testbench/dut/gp/LED7/ns
add wave -noupdate /DE1_SoC_testbench/dut/io/Left/press
add wave -noupdate /DE1_SoC_testbench/dut/io/Right/press
add wave -noupdate /DE1_SoC_testbench/dut/l/reset
add wave -noupdate /DE1_SoC_testbench/dut/l/xnor_out
add wave -noupdate /DE1_SoC_testbench/dut/c/A
add wave -noupdate /DE1_SoC_testbench/dut/c/B
add wave -noupdate /DE1_SoC_testbench/dut/c/out
add wave -noupdate {/DE1_SoC_testbench/dut/clk[0]}
add wave -noupdate /DE1_SoC_testbench/dut/L
add wave -noupdate /DE1_SoC_testbench/dut/R
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9147 ps} 0}
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
WaveRestoreZoom {0 ps} {52702 ps}
