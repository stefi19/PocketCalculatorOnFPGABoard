@echo off
set xv_path=C:\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto e93529002c984b24b2176fe18c44ecb5 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot ALU_behav xil_defaultlib.ALU -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
