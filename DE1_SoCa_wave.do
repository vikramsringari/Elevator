onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /DE1_SoCa_testbench/HEX0
add wave -noupdate -expand /DE1_SoCa_testbench/HEX1
add wave -noupdate /DE1_SoCa_testbench/HEX2
add wave -noupdate /DE1_SoCa_testbench/HEX3
add wave -noupdate /DE1_SoCa_testbench/HEX4
add wave -noupdate /DE1_SoCa_testbench/HEX5
add wave -noupdate /DE1_SoCa_testbench/LEDR
add wave -noupdate /DE1_SoCa_testbench/KEY
add wave -noupdate /DE1_SoCa_testbench/SW
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {63 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {252 ps}
