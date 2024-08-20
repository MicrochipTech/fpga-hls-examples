# Configure and run Synthesis

configure_tool -name {SYNTHESIZE} \
	-params {BLOCK_MODE:false} \
	-params {BLOCK_PLACEMENT_CONFLICTS:ERROR} \
	-params {BLOCK_ROUTING_CONFLICTS:LOCK} \
	-params {CLOCK_ASYNC:12} \
	-params {CLOCK_DATA:5000} \
	-params {CLOCK_GLOBAL:2} \
	-params {PA4_GB_COUNT:34} \
	-params {PA4_GB_MAX_RCLKINT_INSERTION:16} \
	-params {PA4_GB_MIN_GB_FANOUT_TO_USE_RCLKINT:300} \
	-params {RAM_OPTIMIZED_FOR_POWER:0} \
	-params {RETIMING:false} \
	-params {SEQSHIFT_TO_URAM:0} \
	-params {SYNPLIFY_OPTIONS:} \
	-params {SYNPLIFY_TCL_FILE:}
	
puts "Synthesize completed successfully\n"
run_tool_wrapper "run_tool -name SYNTHESIZE"

# Configure and run Place and Route for max timing optimization
# In this phase, the goal is to meet max timing requirements
# Recommendations:
#   - Start with regular effort (EFFORT_LEVEL:false)
#   - Try high effort (EFFORT_LEVEL:true) if timing is not met with regular effort
#   - If you are still not meeting timing, go back to the synthesis step and try different 'strategies'
#   - If you are still not meeting timing, consider optimizing your RTL next
#   - Do not run multi-pass unless absolutely necessary and the design is close to completion
#   - Do not run Min-delay-repair until max timing has been met


configure_tool -name {PLACEROUTE} \
	-params {DELAY_ANALYSIS:MAX} \
	-params EFFORT_LEVEL:$Effort_Level \
	-params {INCRPLACEANDROUTE:false} \
	-params {IOREG_COMBINING:true} \
	-params {MULTI_PASS_CRITERIA:VIOLATIONS} \
	-params MULTI_PASS_LAYOUT:$Multi_Pass_Layout \
	-params {NUM_MULTI_PASSES:5} \
	-params {PDPR:false} \
	-params {RANDOM_SEED:0} \
	-params REPAIR_MIN_DELAY:$Repair_Min_Delay \
	-params {SLACK_CRITERIA:WORST_SLACK} \
	-params {SPECIFIC_CLOCK:} \
	-params {START_SEED_INDEX:1} \
	-params {STOP_ON_FIRST_PASS:false} \
	-params {TDPR:true} \
	
	
puts "Placeroute completed successfully\n"
run_tool_wrapper "run_tool -name PLACEROUTE"

# Configure and run Timing Verification

configure_tool -name {VERIFYTIMING} \
	-params {CONSTRAINTS_COVERAGE:1} \
	-params {FORMAT:XML} \
	-params {CONSTRAINTS_COVERAGE:1} \
    -params {CONSTRAINTS_COVERAGE:1} \
    -params {MAX_TIMING_MULTI_CORNER:1} \
    -params {MAX_TIMING_VIOLATIONS_MULTI_CORNER:1} \
    -params {MIN_TIMING_MULTI_CORNER:1} \
    -params {MIN_TIMING_VIOLATIONS_MULTI_CORNER:1} \
    -params {MAX_TIMING_FAST_HV_LT:1} \
    -params {MAX_TIMING_SLOW_LV_HT:1} \
    -params {MAX_TIMING_SLOW_LV_LT:1} \
    -params {MIN_TIMING_FAST_HV_LT:1} \
    -params {MIN_TIMING_SLOW_LV_HT:1} \
    -params {MIN_TIMING_SLOW_LV_LT:1} \
    -params {MAX_TIMING_VIOLATIONS_FAST_HV_LT:1} \
    -params {MAX_TIMING_VIOLATIONS_SLOW_LV_HT:1} \
    -params {MAX_TIMING_VIOLATIONS_SLOW_LV_LT:1} \
    -params {MIN_TIMING_VIOLATIONS_FAST_HV_LT:1} \
    -params {MIN_TIMING_VIOLATIONS_SLOW_LV_HT:1} \
    -params {MIN_TIMING_VIOLATIONS_SLOW_LV_LT:1} \
    -params {MAX_EXPANDED_PATHS_TIMING:1} \
    -params {MAX_EXPANDED_PATHS_VIOLATION:0} \
    -params {MAX_PARALLEL_PATHS_TIMING:1} \
    -params {MAX_PARALLEL_PATHS_VIOLATION:1} \
    -params {MAX_PATHS_TIMING:5} \
    -params {MAX_PATHS_VIOLATION:20} \
    -params {SLACK_THRESHOLD_VIOLATION:0.0}
	
	
puts "Verifytiming completed successfully\n"

run_tool_wrapper "run_tool -name VERIFYTIMING"

save_project
