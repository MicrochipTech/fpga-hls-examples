$ErrorActionPreference = "Stop"

$prjDir="SEVPFSOC_H264"
$HLS_PATH="script_support/additional_configurations/smarthls/hls_pipeline"

try {
	$args = "SMARTHLS:$HLS_PATH+SYNTHESIZE"
	libero SCRIPT:MPFS_SEV_KIT_REFERENCE_DESIGN.tcl "SCRIPT_ARGS:$args" logfile:partial_out.txt | Write-Output

	Write-Output "------[ Identify ]--------"	
	pushd "./SEVPFSOC_H264/synthesis/"
	# Alternatively, via the Env: *drive*:
	if (-not (Test-Path env:HLS_SYNPLIFY_PATH)) {
		$synplify_exe = "synplify_pro"
		$identify_exe = "identify_instrumentor_shell" 
	} else {
		$synplify_exe = $env:HLS_SYNPLIFY_PATH
		$identify_exe = (Split-Path $env:HLS_SYNPLIFY_PATH -Parent) + "/identify_instrumentor_shell"
	}
	Write-Output "Using $synplify_exe, and $identify_exe"

	& $synplify_exe @("-licensetype", "synplifypro_actel", "-batch", "../../script_support/additional_configurations/smarthls/synplify_enable_dbg_mode.tcl") | Write-Output
	& $identify_exe @("-licensetype", "identinstrumentor_actel", "../../script_support/additional_configurations/smarthls/identify_instrument.tcl") | Write-Output
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
