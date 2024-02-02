@echo off
setlocal EnableDelayedExpansion

REM E.g.:
REM   cd sev-kit-reference-design/script_support/additional_configurations/smarthls/hls_pipeline
REM   datapath=fpga arch=riscv_64 compile_and_copy.sh
REM   datapath=cpu  arch=riscv_64 compile_and_copy.sh 

FOR /F "tokens=*" %%g IN ('where shls.bat') do (SET SHLS_PATH=%%g)
for %%F in (%SHLS_PATH%) do set SHLS_ROOT_DIR=%%~dpF..\
set "EXAMPLE_ROOT_FOLDER=..\..\..\..\.."

set "MODULE=hls_pipeline"

REM datapath: fpga|cpu
set "datapath=%1"
if not defined datapath set "datapath=fpga"

REM arch: risc_64|x86_64
set "arch=%2"
if not defined arch set "arch=riscv_64"

set "ELF=app_%MODULE%.%datapath%.elf"
del /q "%ELF%"

set "HLS_DRIVER_PATH=hls_output\accelerator_drivers"

REM Extra defines to include shared opencv/ffmpeg libraries below:
set "OPENCV_PATH=%SHLS_ROOT_DIR%\smarthls-library\external\vision\precompiled_sw_libraries\opencv4.5.4-%arch%"
set "FFMPEG_PATH=%SHLS_ROOT_DIR%\smarthls-library\external\vision\precompiled_sw_libraries\ffmpeg4.4-%arch%"

set "LD_LIBRARY_PATH=%OPENCV_PATH%\lib;%FFMPEG_PATH%\lib;%LD_LIBRARY_PATH%"
set "PATH=%FFMPEG_PATH%\bin;%PATH%"

set "SRCS= app_%MODULE%.%datapath%.cpp"
set "SRCS=%SRCS% %HLS_DRIVER_PATH%\%MODULE%_accelerator_driver.cpp"

set "INCLUDES= -I%HLS_DRIVER_PATH%"
set "INCLUDES=%INCLUDES% -I%SHLS_ROOT_DIR%\smarthls-library"
set "INCLUDES=%INCLUDES% -I%OPENCV_PATH%\include\opencv4"

set "CFLAGS= -O3 -DHAS_OS -DHAS_ACCELERATOR"
set "CFLAGS=%CFLAGS% -Wall -std=c++11"
REM set "CFLAGS=%CFLAGS% -DHLS_DBG_PRINTF"
REM set "CFLAGS=%CFLAGS% -DHLS_PROFILER_SAMPLES=100"
REM set "CFLAGS=%CFLAGS% -DHLS_PROFILER_ENABLE"

set "LFLAGS= -L%SHLS_ROOT_DIR%\smarthls-library\hls"
set "LFLAGS=%LFLAGS% -L%OPENCV_PATH%\lib"
set "LFLAGS=%LFLAGS% -L%FFMPEG_PATH%\lib"
set "LFLAGS=%LFLAGS% -Wl,-rpath-link,%FFMPEG_PATH%\lib"
set "LFLAGS=%LFLAGS% -pthread -lm -lrt -lstdc++ -fpermissive"
set "LFLAGS=%LFLAGS% -lopencv_videoio -lopencv_imgcodecs -lopencv_imgproc"
set "LFLAGS=%LFLAGS% -lopencv_core -lavcodec -lavformat -lavutil -lswscale -lswresample"
set "LFLAGS=%LFLAGS% -latomic"

if "%arch%" == "riscv_64" (
    set "CXX=riscv64-unknown-linux-gnu-g++"
    set "LFLAGS=%LFLAGS% -lhls_riscv64_accel"
    set "CFLAGS=%CFLAGS% -march=rv64gc -mcmodel=medany -mabi=lp64d"
) else (
    REM x86_64
    set "CXX=g++"
    set "LFLAGS=%LFLAGS% -lhls_x86"
)

"%CXX%" %SRCS% %INCLUDES% %CFLAGS% %LFLAGS% -o "%ELF%"

if %BOARD_IP% =="" (
    echo "** Error **. Please define BOARD_IP environment variable!"
    exit /b 1
)

if "%arch%" == "riscv_64" (
    echo "Copying file to board...(BOARD_IP:%BOARD_IP%)"
    scp %ELF% root@%BOARD_IP%:/srv/www/test/h264/

    echo "Deleting output files"
    ssh root@%BOARD_IP% "rm -f /srv/www/test/h264/output.*"
)
