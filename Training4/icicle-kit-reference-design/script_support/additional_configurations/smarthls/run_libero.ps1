# PowerShell script for running Libero with SmartHLS configuration
# Usage:
#   cd icicle-kit-reference-design
#   .\script_support\additional_configurations\smarthls\run_libero.ps1

# Stop on any error
$ErrorActionPreference = 'Stop'

# Set project directory and HLS path
$prjDir = "soc"
$HLS_PATH = ".\script_support\additional_configurations\smarthls\invert_and_threshold"

# Start from a clean state
Remove-Item -Recurse -Force "$HLS_PATH\hls_output" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force $prjDir -ErrorAction SilentlyContinue

# Compile the Icicle reference design
$target = "SMARTHLS:$HLS_PATH+EXPORT_FPE:./$prjDir+HSS_UPDATE:1"


$liberoArgs = @( 
    "script:MPFS_ICICLE_KIT_REFERENCE_DESIGN.tcl" 
    "script_args:$target" 
    "logfile:$prjDir/MPFS_ICICLE_KIT_REFERENCE_DESIGN.log" 
)

& libero @liberoArgs | Write-Output
