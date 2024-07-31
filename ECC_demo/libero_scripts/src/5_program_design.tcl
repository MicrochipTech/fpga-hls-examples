# Configure and generate programming file data
## run_tool -name GENERATEPROGRAMMINGFILE
run_tool_wrapper "run_tool -name GENERATEPROGRAMMINGFILE"


puts "Programmingfile generated successfully\n"
    
# Export STAPL file
export_bitstream_file \
         -file_name {top} \
         -export_dir ${PrjLocation}/designer/top/export \
         -format {STP} \
         -force_rtg4_otp 0 

puts "Exported bit stream successfully\n"

# Export Programming Job
# Programming job files can be imported in FlasPro Express standalone for programming the device
export_prog_job \
         -job_file_name {top} \
         -export_dir ${PrjLocation}/designer/top/export \
         -force_rtg4_otp 0 \
         -design_bitstream_format {STP} 
	
puts "Exported job file successfully\n"
puts "Full design flow passed execution\n"	
