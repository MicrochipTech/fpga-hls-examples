@echo "off"
SET prjDir=SEVPFSOC_H264
SET HLS_PATH=script_support\additional_configurations\smarthls\hls_pipeline
rmdir /S /Q %HLS_PATH%\hls_output 
rmdir /S /Q %prjDir% 
rmdir /S /Q component

SET target=SMARTHLS:%HLS_PATH% SYNTHESIZE

libero.exe SCRIPT:MPFS_SEV_KIT_REFERENCE_DESIGN.tcl "SCRIPT_ARGS:%target%" logfile:partial_out.txt
echo "------[ Identify ]--------"
pushd "./SEVPFSOC_H264/synthesis/"
synplify_pro.exe -licensetype synplifypro_actel -batch ..\..\script_support\additional_configurations\smarthls\synplify_enable_dbg_mode.tcl
identify_instrumentor_shell "-licensetype" "identinstrumentor_actel" "..\..\script_support\additional_configurations\smarthls\identify_instrument.tcl"
popd


echo "------[ Full build ]--------"
SET "target=SYNTHESIZE VERIFYTIMING EXPORT_FPE:%prjDir% EXPORT_SMARTDEBUG:%prjDir% HSS_UPDATE"
libero.exe script:MPFS_SEV_KIT_REFERENCE_DESIGN.tcl "SCRIPT_ARGS:%target%" logfile:full_out.txt
echo "ALL DONE"
