# datapath: fpga|cpu
# arch: risc_64|x86_64

param(
    [string]$datapath="fpga",
    [string]$arch="riscv_64"
)

# Set strict mode
Set-StrictMode -Version Latest

# Determine the location of SmartHLS
$SHLS_ROOT_DIR = Split-Path -Parent (Split-Path -Parent (Get-Command shls).Source)
Write-Host  "SmartHLS root directory: $SHLS_ROOT_DIR"

$EXAMPLE_ROOT_FOLDER = Join-Path -Path $PSScriptRoot -ChildPath './../../../../../'
Write-Host "Example root folder: $EXAMPLE_ROOT_FOLDER"

$MODULE = 'hls_pipeline'

$ELF = ".\app_${MODULE}.${datapath}.elf"
Write-Host "Output ELF file: $ELF"
Remove-Item -Path $ELF -ErrorAction SilentlyContinue

$HLS_DRIVER_PATH = "hls_output\accelerator_drivers\"

# Extra defines to include shared opencv/ffmpeg libraries below:
$OPENCV_PATH = Join-Path -Path $EXAMPLE_ROOT_FOLDER -ChildPath "precompiled\shls_sw_dependencies\opencv4.5.4-$arch"
$FFMPEG_PATH = Join-Path -Path $EXAMPLE_ROOT_FOLDER -ChildPath "precompiled\shls_sw_dependencies\ffmpeg4.4-$arch"

$env:PATH = "$OPENCV_PATH\lib;$FFMPEG_PATH\lib;$FFMPEG_PATH\bin;$env:PATH"

# Sources:
$COMMAND_ARGS = @()
$COMMAND_ARGS += ".\app_${MODULE}.${datapath}.cpp"
$COMMAND_ARGS += "$HLS_DRIVER_PATH\${MODULE}_accelerator_driver.cpp"

# Include Paths:
$COMMAND_ARGS += "-I$HLS_DRIVER_PATH"
$COMMAND_ARGS += "-I$SHLS_ROOT_DIR\smarthls-library"
$COMMAND_ARGS += "-I$OPENCV_PATH\include\opencv4"

# C Flags:
$COMMAND_ARGS += "-O3"
$COMMAND_ARGS += "-DHAS_OS"
$COMMAND_ARGS += "-DHAS_ACCELERATOR"
$COMMAND_ARGS += "-Wall"
$COMMAND_ARGS += "-std=c++11"

# Linking Flags:
$COMMAND_ARGS += "-L$SHLS_ROOT_DIR\smarthls-library\hls"
$COMMAND_ARGS += "-L$OPENCV_PATH\lib"
$COMMAND_ARGS += "-L$FFMPEG_PATH\lib"
$COMMAND_ARGS += "-Wl`,-rpath-link`,$FFMPEG_PATH\lib"
$COMMAND_ARGS += "-pthread"
$COMMAND_ARGS += "-lm"
$COMMAND_ARGS += "-lrt"
$COMMAND_ARGS += "-lstdc++"
$COMMAND_ARGS += "-fpermissive"

# OpenCV/FFmpeg Linker Flags
$COMMAND_ARGS += "-lopencv_videoio"
$COMMAND_ARGS += "-lopencv_imgcodecs"
$COMMAND_ARGS += "-lopencv_imgproc"
$COMMAND_ARGS += "-lopencv_core"
$COMMAND_ARGS += "-lavcodec"
$COMMAND_ARGS += "-lavformat"
$COMMAND_ARGS += "-lavutil"
$COMMAND_ARGS += "-lswscale"
$COMMAND_ARGS += "-lswresample"
$COMMAND_ARGS += "-latomic"

if ($arch -eq "riscv_64") {
    $CXX = "riscv64-unknown-linux-gnu-g++"
    $COMMAND_ARGS += "-lhls_riscv64_accel"
    $COMMAND_ARGS += "-march=rv64gc"
    $COMMAND_ARGS += "-mcmodel=medany"
    $COMMAND_ARGS += "-mabi=lp64d"
} else {
    # x86_64
    $CXX = "g++"
    $COMMAND_ARGS += "-lhls_x86"
}

$COMMAND_ARGS += "-o"
$COMMAND_ARGS += $ELF

Write-Host "$CXX $COMMAND_ARGS"

& $CXX $COMMAND_ARGS

if ($null -eq $env:BOARD_IP) {
    Write-Error "** Error **. Please define BOARD_IP environment variable!"
    exit
}

if ($arch -eq "riscv_64") {
    $copy_path = "root@" + $env:BOARD_IP + ":/srv/www/test/h264/"
    Write-Host "Copying file to board...(BOARD_IP:$copy_path)"
    scp $ELF $copy_path

    Write-Host "Deleting output files"
    ssh "root@$env:BOARD_IP" "rm -f /srv/www/test/h264/output.*"
}