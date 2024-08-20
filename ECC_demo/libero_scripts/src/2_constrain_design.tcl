# -------------------------------------------------------------------------------------------
# Link I/O constraints (PDC) and associate constraints to Place and route tool
import_files -io_pdc {./src/src_constraints/io_constraints.pdc}

# -------------------------------------------------------------------------------------------
# Derive SDC constraints from the design and the configured cores generated constraints
derive_constraints_sdc

# -------------------------------------------------------------------------------------------
# Link user SDC constraints (not expressed by the derived constraints)
# and optionally associate to Synthesis, Place and Route and Timing Verification as needed
# Below is an example

organize_tool_files -tool {SYNTHESIZE} \
    -file ${PrjLocation}/constraint/top_derived_constraints.sdc \
    -module {top::work} \
    -input_type {constraint}
organize_tool_files -tool {PLACEROUTE} \
    -file ${PrjLocation}/constraint/top_derived_constraints.sdc \
    -file ${PrjLocation}/constraint/io/io_constraints.pdc \
    -module {top::work} \
    -input_type {constraint}
organize_tool_files -tool {VERIFYTIMING} \
    -file ${PrjLocation}/constraint/top_derived_constraints.sdc \
    -module {top::work} \
    -input_type {constraint}

## run_tool -name {CONSTRAINT_MANAGEMENT} 
run_tool_wrapper "run_tool -name {CONSTRAINT_MANAGEMENT} 
"

save_project
puts "Imported and derived constraints successfully\n"
