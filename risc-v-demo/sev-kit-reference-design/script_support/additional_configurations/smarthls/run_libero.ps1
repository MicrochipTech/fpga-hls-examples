$ErrorActionPreference = "Stop"

$prjDir="SEVPFSOC_H264"
$HLS_PATH="script_support/additional_configurations/smarthls/hls_pipeline"

try {
	$args = "SMARTHLS:$HLS_PATH+SYNTHESIZE"
	libero SCRIPT:MPFS_SEV_KIT_REFERENCE_DESIGN.tcl "SCRIPT_ARGS:$args" logfile:partial_out.txt | Write-Output

	Write-Output "------[ Identify ]--------"	
	pushd "./SEVPFSOC_H264/synthesis/"
	synplify_pro -licensetype synplifypro_actel -batch ..\..\script_support\additional_configurations\smarthls\synplify_enable_dbg_mode.tcl | Write-Output
	identify_instrumentor_shell "-licensetype" "identinstrumentor_actel" "..\..\script_support\additional_configurations\smarthls\identify_instrument.tcl" | Write-Output
	popd

	$args = "SYNTHESIZE+PLACEROUTE+VERIFYTIMING+EXPORT_FPE:$prjDir+EXPORT_SMARTDEBUG:$prjDir+HSS_UPDATE:1"
	Write-Output "$args"
	Write-Output "------[ Full build ]--------"
	libero script:MPFS_SEV_KIT_REFERENCE_DESIGN.tcl "SCRIPT_ARGS:$args" logfile:full_out.txt | Write-Output
	Write-Output "ALL DONE"
} catch {
	Write-Output "ERROR: Something went wrong!"
	$Error[0].Exception.Message
}
