# Exporting core ClassifierPipeline_top to TCL
# Exporting Create HDL core command for module ClassifierPipeline_top
create_hdl_core -file {hdl/digit_recognition.v} -module {ClassifierPipeline_top} -library {work} -package {}
# Exporting BIF information of  HDL core command for module ClassifierPipeline_top
hdl_core_add_bif -hdl_core_name {ClassifierPipeline_top} -bif_definition {AXI4Stream:AMBA:AMBA4:master} -bif_name {classifier_output_axi4stream} -signal_map {\
"TDATA:classifier_output" \
"TREADY:classifier_output_ready" \
"TVALID:classifier_output_valid" }
