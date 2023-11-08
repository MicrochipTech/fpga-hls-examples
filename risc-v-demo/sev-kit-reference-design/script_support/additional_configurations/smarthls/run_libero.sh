#!/bin/bash
#
# Usage:
#   ./script_support/additional_configurations/smarthls/run_libero.sh
#
# Notes:
#   EXPORT_SMARTDEBUG: Generates the .ddc file for SmartDebug
#
set -e

prjDir=SEVPFSOC_H264
HLS_PATH=./script_support/additional_configurations/smarthls/hls_pipeline

#
# Start from a clean state
#
rm -rf \
    $HLS_PATH/hls_output \
    $prjDir \
    component

#  
# Compile the Icicle reference design
# 
target=
target=$target+SMARTHLS:$HLS_PATH
target=$target+SYNTHESIZE

time libero \
    script:MPFS_SEV_KIT_REFERENCE_DESIGN.tcl  \
    script_args:$target

echo "------[ Identify ]--------"
pushd ./SEVPFSOC_H264/synthesis/
synplify_pro -licensetype synplifypro_actel -batch ../../script_support/additional_configurations/smarthls/synplify_enable_dbg_mode.tcl
identify_instrumentor_shell -licensetype identinstrumentor_actel ../../script_support/additional_configurations/smarthls/identify_instrument.tcl
popd

echo "------[ Full build ]--------"
target=
target=$target+SYNTHESIZE
target=$target+VERIFYTIMING
target=$target+EXPORT_FPE:./$prjDir
target=$target+EXPORT_SMARTDEBUG:./$prjDir
target=$target+HSS_UPDATE
time libero \
    script:MPFS_SEV_KIT_REFERENCE_DESIGN.tcl  \
    script_args:$target

echo "ALL DONE"
