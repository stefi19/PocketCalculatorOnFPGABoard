proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir {D:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.cache/wt} [current_project]
  set_property parent.project_path {D:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.xpr} [current_project]
  set_property ip_output_repo {{D:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.cache/ip}} [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  add_files -quiet {{D:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.runs/synth_1/Calculator.dcp}}
  read_xdc {{D:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.srcs/constrs_1/new/basys3.xdc}}
  link_design -top Calculator -part xc7a100tcsg324-1
  write_hwdef -file Calculator.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force Calculator_opt.dcp
  catch { report_drc -file Calculator_drc_opted.rpt }
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force Calculator_placed.dcp
  catch { report_io -file Calculator_io_placed.rpt }
  catch { report_utilization -file Calculator_utilization_placed.rpt -pb Calculator_utilization_placed.pb }
  catch { report_control_sets -verbose -file Calculator_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force Calculator_routed.dcp
  catch { report_drc -file Calculator_drc_routed.rpt -pb Calculator_drc_routed.pb -rpx Calculator_drc_routed.rpx }
  catch { report_methodology -file Calculator_methodology_drc_routed.rpt -rpx Calculator_methodology_drc_routed.rpx }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file Calculator_timing_summary_routed.rpt -rpx Calculator_timing_summary_routed.rpx }
  catch { report_power -file Calculator_power_routed.rpt -pb Calculator_power_summary_routed.pb -rpx Calculator_power_routed.rpx }
  catch { report_route_status -file Calculator_route_status.rpt -pb Calculator_route_status.pb }
  catch { report_clock_utilization -file Calculator_clock_utilization_routed.rpt }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force Calculator_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force Calculator.mmi }
  write_bitstream -force -no_partial_bitfile Calculator.bit 
  catch { write_sysdef -hwdef Calculator.hwdef -bitfile Calculator.bit -meminfo Calculator.mmi -file Calculator.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

