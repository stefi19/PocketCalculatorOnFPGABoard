# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {D:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.cache/wt} [current_project]
set_property parent.project_path {D:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo {d:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  {D:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.srcs/sources_1/new/Adder1Bit.vhd}
  {D:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.srcs/sources_1/new/Adder7Bit.vhd}
  {D:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.srcs/sources_1/new/comparator8bit.vhd}
  {D:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.srcs/sources_1/new/Multiplicator.vhd}
  {D:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.srcs/sources_1/new/divider8bit.vhd}
  {D:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.srcs/sources_1/new/Complement2.vhd}
  {D:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.srcs/sources_1/new/SSD.vhd}
  {D:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.srcs/sources_1/new/ALU8Bits.vhd}
  {D:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.srcs/sources_1/new/Calculator.vhd}
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc {{D:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.srcs/constrs_1/new/basys3.xdc}}
set_property used_in_implementation false [get_files {{D:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.srcs/constrs_1/new/basys3.xdc}}]


synth_design -top Calculator -part xc7a100tcsg324-1


write_checkpoint -force -noxdef Calculator.dcp

catch { report_utilization -file Calculator_utilization_synth.rpt -pb Calculator_utilization_synth.pb }
