#!/bin/bash
# E.g.:
#   cd sev-kit-reference-design/script_support/additional_configurations/smarthls/hls_pipeline
#   datapath=fpga arch=riscv_64 compile_and_copy.sh
#   datapath=cpu  arch=riscv_64 compile_and_copy.sh 
set -e

# Determine the location of SmartHLS
SHLS_ROOT_DIR=$(dirname $(which shls))/..

EXAMPLE_ROOT_FOLDER=./../../../../../

MODULE=hls_pipeline

# datapath: fpga|cpu
datapath=${datapath:-fpga}

# arch: risc_64|x86_64
arch=${arch:-riscv_64}

ELF=app_${MODULE}.${datapath}.elf
rm -f $ELF

HLS_DRIVER_PATH="./hls_output/accelerator_drivers"

# Extra defines to include shared opencv/ffmpeg libraries below:
OPENCV_PATH=$EXAMPLE_ROOT_FOLDER/precompiled/shls_sw_dependencies/opencv4.5.4-$arch
FFMPEG_PATH=$EXAMPLE_ROOT_FOLDER/precompiled/shls_sw_dependencies/ffmpeg4.4-$arch

LD_LIBRARY_PATH=$OPENCV_PATH/lib:$FFMPEG_PATH/lib:$LD_LIBRARY_PATH
PATH=$FFMPEG_PATH/bin:$PATH

SRCS=" ./app_${MODULE}.${datapath}.cpp"
SRCS+=" $HLS_DRIVER_PATH/${MODULE}_accelerator_driver.cpp"

INCLUDES=" -I$HLS_DRIVER_PATH"
INCLUDES+=" -I$SHLS_ROOT_DIR/smarthls-library"
INCLUDES+=" -I$OPENCV_PATH/include/opencv4"

CFLAGS=" -O3 -DHAS_OS -DHAS_ACCELERATOR"
CFLAGS+=" -Wall -std=c++11"
# CFLAGS+=" -DHLS_DBG_PRINTF"
# CFLAGS+=" -DHLS_PROFILER_SAMPLES=100"
# CFLAGS+=" -DHLS_PROFILER_ENABLE"

LFLAGS+=" -L$SHLS_ROOT_DIR/smarthls-library/hls"
LFLAGS+=" -L$OPENCV_PATH/lib"
LFLAGS+=" -L$FFMPEG_PATH/lib"
LFLAGS+=" -Wl,-rpath-link,$FFMPEG_PATH/lib"
LFLAGS+=" -pthread -lm -lrt -lstdc++ -fpermissive"
LFLAGS+=" -lopencv_videoio -lopencv_imgcodecs -lopencv_imgproc"
LFLAGS+=" -lopencv_core -lavcodec -lavformat -lavutil -lswscale -lswresample"
LFLAGS+=" -latomic"

if [ "$arch" == "riscv_64" ]; then 
    CXX=riscv64-unknown-linux-gnu-g++
    LFLAGS+=" -lhls_riscv64_accel"
    CFLAGS+=" -march=rv64gc -mcmodel=medany -mabi=lp64d"
else 
    # x86_64
    CXX=g++
    LFLAGS+=" -lhls_x86"
fi

$CXX $SRCS $INCLUDES $CFLAGS $LFLAGS -o $ELF

if [ "$BOARD_IP" == "" ]; then 
    echo "** Error **. Please define BOARD_IP environment variable!"
    exit
fi

if [ "$arch" == "riscv_64" ]; then 
    echo "Copying file to board...(BOARD_IP:$BOARD_IP)"
    scp $ELF root@$BOARD_IP:/srv/www/test/h264/

    echo "Deleting output files"
    ssh root@$BOARD_IP "rm -f /srv/www/test/h264/output.*"
fi


