# Pre-Compiled Software Libraries

## Overview
The precompiled_sw_libraries folder should contain the OpenCV and FFmpeg libraries, which can be download from the release assets. 

## Before Running:
You need to rename the libraries based on your OS.

### Linux
Open the terminal, and enter the following:

```bash
cd <PATH TO INSTALLATION DIRECTORY>/vision/precompiled_sw_libraries

wget https://github.com/MicrochipTech/fpga-hls-libraries/releases/download/v2024.1/opencv4.5.4-x86_64-linux.tar.gz
tar -xzvf opencv4.5.4-x86_64-linux.tar.gz
mv opencv4.5.4-x86_64-linux opencv4.5.4-x86_64

wget https://github.com/MicrochipTech/fpga-hls-libraries/releases/download/v2024.1/ffmpeg4.4-x86_64-linux.tar.gz
tar -xzvf ffmpeg4.4-x86_64-linux.tar.gz
mv ffmpeg4.4-x86_64-linux ffmpeg4.4-x86_64
```

### Windows
Open a Windows Command Prompt (cmd), and enter the following:

```
cd <PATH TO INSTALLATION DIRECTORY>/vision/precompiled_sw_libraries

curl -LO https://github.com/MicrochipTech/fpga-hls-libraries/releases/download/v2024.1/opencv4.5.4-x86_64-win.tar.gz
tar -xzvf opencv4.5.4-x86_64-win.tar.gz
move opencv4.5.4-x86_64-win opencv4.5.4-x86_64

curl -LO https://github.com/MicrochipTech/fpga-hls-libraries/releases/download/v2024.1/ffmpeg4.4-x86_64-win.tar.gz
tar -xzvf ffmpeg4.4-x86_64-win.tar.gz
move ffmpeg4.4-x86_64-win ffmpeg4.4-x86_64
```

## On-Board
We have also included versions of the OpenCV and FFmpeg libraries that run on the PFSoC IcicleKit Board. To transfer the libraries to the board, follow the instructions below.

### Linux
Open a terminal, go to the directory where the precompiled libraries are located and use secure copy (scp command): 

```
cd 
<SMARTHLS_DIR>/smarthls-library/external/vision/precompiled_sw_libraries

scp -r ffmpeg4.4-riscv64 opencv4.5.4-riscv_64 \
  	root@<BOARD_IP>:/home/root/shls_sw_dependencies
```

Once the the FFmpeg and OpenCV libraries have been copied onto the board make sure to update their references using Makefile Variables in Makefile.user in order for them to run properly on the board.


Make sure to replace `<BOARD_IP>` with the IP of your PFSoC IcicleKit Board.

### Windows

If you are using Windows Command Prompt, you will need to download [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html), which includes PSCP (SCP for Windows).

Then, open the Windows Command Prompt, go to the directory where the precompiled libraries are located and use secure copy (scp command): 

```
cd 
<SMARTHLS_DIR>/smarthls-library/external/vision/precompiled_sw_libraries

pscp -r ffmpeg4.4-riscv64 opencv4.5.4-riscv_64 \
  	root@<BOARD_IP>:/home/root/shls_sw_dependencies
```
Once the the FFmpeg and OpenCV libraries have been copied onto the board, make sure to update their references using Makefile Variables in Makefile.user in order for them to run properly on-board.


Make sure to replace `<BOARD_IP>` with the IP of your PFSoC IcicleKit Board.

Alternatively, if you do not want to use the terminal, you can use external programs, such as FileZilla or WinSCP to copy the files to the board.


