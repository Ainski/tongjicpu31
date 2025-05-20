-makelib ies/xil_defaultlib -sv \
  "D:/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies/xpm \
  "D:/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../project_1.srcs/sources_1/ip/divider/divider_clk_wiz.v" \
  "../../../../project_1.srcs/sources_1/ip/divider/divider.v" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

