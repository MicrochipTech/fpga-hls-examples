#
# This script is needed to set the environment variables for compilation.
# It will set the right paths for the FFMPEG and OPENCV libraries depending
# on where the code is running, on-board vs. on-host.
#

# arch=riscv64|x86_64 ; default = riscv64
arch=${arch:-riscv_64}
echo "arch:$arch"

link="$(readlink -f "$0" 2>/dev/null || readlink "$0")" || true
if [ -n "$link" ]; then
        SCRIPT_DIR="$(dirname "$link")"
else
        SCRIPT_DIR="$(dirname "$0")"
fi
EXAMPLE_ROOT_DIR=$SCRIPT_DIR/../../../../../../

if [ $arch == "x86_64" ]; then 
    # Paths when running on the host machine
    OPENCV_PATH=$EXAMPLE_ROOT_DIR/precompiled/shls_sw_dependencies/opencv4.5.4-$arch
    FFMPEG_PATH=$EXAMPLE_ROOT_DIR/precompiled/shls_sw_dependencies/ffmpeg4.4-$arch
else
    # Paths when running on-board
    OPENCV_PATH=`realpath /usr/local/shls_sw_dependencies/opencv4.5.4-$arch`
    FFMPEG_PATH=`realpath /usr/local/shls_sw_dependencies/ffmpeg4.4-$arch`
fi

export LD_LIBRARY_PATH=$OPENCV_PATH/lib:$FFMPEG_PATH/lib:$LD_LIBRARY_PATH
export PATH=$FFMPEG_PATH/bin:$PATH

if [ $arch == "x86_64" ]; then 
    SHLS_ROOT_DIR=$(dirname $(which shls))
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$SHLS_ROOT_DIR/smarthls-library/hls
fi

echo "OPENCV_PATH=$OPENCV_PATH"
echo "FFMPEG_PATH=$FFMPEG_PATH"
echo "LD_LIBRARY_PATH=$LD_LIBRARY_PATH"