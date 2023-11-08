#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color.

link="$(readlink -f "$0" 2>/dev/null || readlink "$0")" || true
if [ -n "$link" ]; then
        THIS_SCRIPT_DIR="$(dirname "$link")"
else
        THIS_SCRIPT_DIR="$(dirname "$0")"
fi

DOWNLOAD_FOLDER=$THIS_SCRIPT_DIR/

printf "${GREEN}pushd stack: ${NC}"
pushd $DOWNLOAD_FOLDER

printf "${GREEN}Download Folder: ${NC}$(pwd)\n"

libraries=( \
    riscv-64-linux/ffmpeg4.4-riscv_64-linux.tar.gz \
    riscv-64-linux/opencv4.5.4-riscv_64-linux.tar.gz \
    )

if [ "$(uname)" == "Linux" ]; then
libraries+=( \
    x86_64-linux/ffmpeg4.4-x86_64-linux.tar.gz \
    x86_64-linux/opencv4.5.4-x86_64-linux.tar.gz \
    )
elif [ "$(uname -o)"  == "Cygwin" ]; then
libraries+=( \
    x86_64-cygwin/ffmpeg4.4-x86_64-cygwin.tar.gz \
    x86_64-cygwin/opencv4.5.4-x86_64-cygwin.tar.gz \
    )
else
echo "Unrecognized OS $(uname)"
fi

for lib_path in ${libraries[@]}; do
    printf "${GREEN}Downloading $lib_path:${NC}\n"
    curl https://ww1.microchip.com/downloads/aemDocuments/softwarelibrary/smarthls/$lib_path --output $(basename $lib_path)
    archive=$(basename $lib_path)
    printf "${GREEN}Extracting $archive.${NC}\n"
    tar xzpf $archive

    echo ""
done

printf "${GREEN}popd stack: ${NC}"
popd
