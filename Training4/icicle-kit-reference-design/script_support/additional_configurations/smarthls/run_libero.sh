#!/bin/bash
#
# Usage:
#   cd icicle-kit-reference-design
#   ./script_support/additional_configurations/smarthls/run_libero.sh
#
set -e

prjDir=soc

HLS_PATH=./script_support/additional_configurations/smarthls/invert_and_threshold

#
# Start from a clean state
#
rm -rf \
    $HLS_PATH/hls_output \
    $prjDir

#  
# Compile the Icicle reference design
# 
target=SMARTHLS:$HLS_PATH+EXPORT_FPE:./$prjDir+HSS_UPDATE:1
time libero \
    script:MPFS_ICICLE_KIT_REFERENCE_DESIGN.tcl  \
    script_args:$target \
    logfile:$prjDir/MPFS_ICICLE_KIT_REFERENCE_DESIGN.log

