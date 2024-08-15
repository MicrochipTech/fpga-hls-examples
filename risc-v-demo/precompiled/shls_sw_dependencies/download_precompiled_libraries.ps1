# Note: the precompiled libraries are included with your installation of SmartHLS
#       under SMARTHLS_INSTALL_DIR\smarthls-library\external\vision\precompiled_sw_libraries

# Determine the location of SmartHLS
$SHLS_ROOT_DIR = Split-Path -Parent (Split-Path -Parent (Get-Command shls).Source)

Copy-Item "$SHLS_ROOT_DIR\smarthls-library\external\vision\precompiled_sw_libraries\*" -Destination ".\" -Recurse -Exclude "*.tar.gz"