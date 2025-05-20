@echo off
set xv_path=D:\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto ebb25405b8204d7690bd5745b8ac7c48 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L xpm -L dist_mem_gen_v8_0_10 -L unisims_ver -L unimacro_ver -L secureip --snapshot seg7x16_behav xil_defaultlib.seg7x16 xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
