######################################################################
#
# File name : _246tb_ex9_tb_simulate.do
# Created on: Sat May 17 16:13:50 +0800 2025
#
# Auto generated by Vivado for 'post-synthesis' simulation
#
######################################################################
vsim -voptargs="+acc" +transport_int_delays +pulse_r/0 +pulse_int_r/0 -L simprims_ver -L secureip -L xil_defaultlib -lib xil_defaultlib xil_defaultlib._246tb_ex9_tb xil_defaultlib.glbl

do {_246tb_ex9_tb_wave.do}

view wave
view structure
view signals

do {_246tb_ex9_tb.udo}

run 1000ns
