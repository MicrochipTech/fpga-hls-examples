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

if [[ -z "${HLS_SYNPLIFY_PATH}" ]]; then
        SYNPLIFY_EXE="synplify_pro"
        IDENTIFY_EXE="identify_instrumentor_shell"
else
        SYNPLIFY_EXE=$HLS_SYNPLIFY_PATH
        IDENTIFY_EXE=$(dirname $HLS_SYNPLIFY_PATH)"/identify_instrumentor_shell"
fi


$SYNPLIFY_EXE -licensetype synplifypro_actel -batch ../../script_support/additional_configurations/smarthls/synplify_enable_dbg_mode.tcl
$IDENTIFY_EXE -licensetype identinstrumentor_actel ../../script_support/additional_configurations/smarthls/identify_instrument.tcl
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
