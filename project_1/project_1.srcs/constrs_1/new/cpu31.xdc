create_clock -period 40.000 -name clk_pin -waveform {0.000 20.000} [get_ports clk_in]


set_property IOSTANDARD LVCMOS33 [get_ports cs]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN E3 [get_ports clk]
set_property PACKAGE_PIN V10 [get_ports cs]
