@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Wed Jan 12 01:41:17 +0800 2022
REM SW Build 2708876 on Wed Nov  6 21:40:23 MST 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim tb_sopc_behav -key {Behavioral:sim_1:Functional:tb_sopc} -tclbatch tb_sopc.tcl -view C:/Users/13773/Desktop/corn/wwx_cpu/wwx_cpu/main_cpu_5/tb_small_cpu_behav.wcfg -log simulate.log"
call xsim  tb_sopc_behav -key {Behavioral:sim_1:Functional:tb_sopc} -tclbatch tb_sopc.tcl -view C:/Users/13773/Desktop/corn/wwx_cpu/wwx_cpu/main_cpu_5/tb_small_cpu_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
