# Pre-Compiled Software Libraries

The shls_sw_dependencies folder should contain the OpenCV and FFmpeg libraries. You can do this in two ways: copying the libraries from your SmartHLS installation, or downloading them from the [fpga-hls-libraries](https://github.com/MicrochipTech/fpga-hls-libraries) release assets. 

## Copying the Libraries From Your SmartHLS Installation

### Linux

Open a terminal, and run enter the following:

```bash
cd <PATH TO INSTALLATION DIRECTORY>/risc-v-demo/precompiled/shls_sw_dependencies

./download_precompiled_libraries.sh
```

### Windows

Open Powershell, and run enter the following:

```bash
cd <PATH TO INSTALLATION DIRECTORY>\risc-v-demo\precompiled\shls_sw_dependencies

.\download_precompiled_libraries.ps1
```

## Downloading From Release Assets:
If you choose to download the precompiled libraries from the [fpga-hls-libraries](https://github.com/MicrochipTech/fpga-hls-libraries), 
you will need to rename them yourself.

### Linux
Open the terminal, and enter the following:

```bash
cd <PATH TO INSTALLATION DIRECTORY>/risc-v-demo/precompiled/shls_sw_dependencies

curl -L https://github.com/MicrochipTech/fpga-hls-libraries/releases/download/v2024.1/opencv4.5.4-x86_64-linux.tar.gz -o opencv4.5.4-x86_64-linux.tar.gz
tar -xzvf opencv4.5.4-x86_64-linux.tar.gz
mv opencv4.5.4-x86_64-linux opencv4.5.4-x86_64

curl -L https://github.com/MicrochipTech/fpga-hls-libraries/releases/download/v2024.1/ffmpeg4.4-x86_64-linux.tar.gz -o ffmpeg4.4-x86_64-linux.tar.gz
tar -xzvf ffmpeg4.4-x86_64-linux.tar.gz
mv ffmpeg4.4-x86_64-linux ffmpeg4.4-x86_64
```

### Windows
Open Powershell, and enter the following:

```
cd <PATH TO INSTALLATION DIRECTORY>\risc-v-demo\precompiled\shls_sw_dependencies

Invoke-WebRequest https://github.com/MicrochipTech/fpga-hls-libraries/releases/download/v2024.1/opencv4.5.4-x86_64-win.tar.gz -o opencv4.5.4-x86_64-win.tar.gz
tar -xzvf opencv4.5.4-x86_64-win.tar.gz
move opencv4.5.4-x86_64-win opencv4.5.4-x86_64

Invoke-WebRequest https://github.com/MicrochipTech/fpga-hls-libraries/releases/download/v2024.1/ffmpeg4.4-x86_64-win.tar.gz -o ffmpeg4.4-x86_64-win.tar.gz
tar -xzvf ffmpeg4.4-x86_64-win.tar.gz
move ffmpeg4.4-x86_64-win ffmpeg4.4-x86_64
```

## On-Board
We have also included versions of the OpenCV and FFmpeg libraries that run on the PFSoC IcicleKit Board. To transfer the libraries to the board, 
after you've copied them to this folder, follow the instructions below.

Open a terminal if you're using Linux or Powershell if you're using Windows. Then type:

```
cd 
cd <PATH TO INSTALLATION DIRECTORY>/risc-v-demo/precompiled/shls_sw_dependencies

scp -r ffmpeg4.4-riscv64 opencv4.5.4-riscv_64 root@<BOARD_IP>:/home/root/shls_sw_dependencies
```

Make sure to replace `<BOARD_IP>` with the IP of your PFSoC IcicleKit Board.

Once the the FFmpeg and OpenCV libraries have been copied onto the board, make sure to update their references using Makefile Variables in Makefile.user in order for them to run properly on-board.


Alternatively, if you do not want to use the terminal, you can use external programs, such as FileZilla or WinSCP to copy the files to the board.

