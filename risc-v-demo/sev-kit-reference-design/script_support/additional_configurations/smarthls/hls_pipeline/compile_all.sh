#!/bin/bash

set -ex

datapath=fpga arch=riscv_64 ./compile_and_copy.sh
datapath=cpu  arch=riscv_64 ./compile_and_copy.sh 

echo "ALL DONE!"