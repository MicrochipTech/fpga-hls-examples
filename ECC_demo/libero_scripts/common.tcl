set RTG4FCCCver {2.0.204}
set RTG4FCCCECALIBver {2.2.009} 

#tool profiles
set synprofile {Synplify Pro ME}
set simuprofile {ModelSim ME Pro}

#RTG4 device details
set die_devkit {RT4G150}
set devkit_package {1657 CG}
set devkit_part_range {MIL}


# A common procedure called by all tests.

# Computes the runtime for each command run in Libero

#

proc run_tool_wrapper { cmd } {

 

  # get tool name from the command

  #

  regexp {run_tool\s+-name\s+\{*(\w*)\}*} $cmd full1 tool;

 

  puts "Starting $tool command";

  set full_cmd "time \{ $cmd \}";

  set TIME_start [clock seconds];
  set runtime [ eval $full_cmd ];
  set TIME_taken [expr [clock seconds] - $TIME_start];
  puts "\nRUNTIME:$tool=$TIME_taken secs\n";

  set runtime_secs [ expr [lindex $runtime 0]/1000000 ];

  puts "\nRUNTIME_bytime:$tool=$runtime_secs secs\n";

 

}

 


