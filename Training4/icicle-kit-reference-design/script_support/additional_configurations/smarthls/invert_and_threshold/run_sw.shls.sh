#!/bin/bash

set -eu

echo "---------------------"
echo "Run SW-only"
shls -s soc_base_proj_run

echo "---------------------"
echo "Run w/HW module"
shls -s soc_accel_proj_run
