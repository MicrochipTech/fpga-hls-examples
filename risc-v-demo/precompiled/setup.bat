@echo off

if not defined BOARD_IP set "BOARD_IP=192.168.2.1"

set "SSH_OPT= -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR "
FOR /F "tokens=*" %%g IN ('where shls.bat') do (SET SHLS_PATH=%%g)
for %%F in (%SHLS_PATH%) do set SHLS_ROOT_DIR=%%~dpF..\

REM Remote command execute over ssh

REM Create the necessary directories
ssh %SSH_OPT% root@%BOARD_IP% rm -rf /usr/local/shls_sw_dependencies
ssh %SSH_OPT% root@%BOARD_IP% rm -rf /srv/www/test
ssh %SSH_OPT% root@%BOARD_IP% mkdir -p /usr/local/shls_sw_dependencies
ssh %SSH_OPT% root@%BOARD_IP% mkdir -p /srv/www/test;"

REM Now copy the necessary files to the board
set "cmd=scp -r %SSH_OPT% "
set "cmd=%cmd% %SHLS_ROOT_DIR%\smarthls-library\external\vision\precompiled_sw_libraries\ffmpeg4.4-riscv_64"
set "cmd=%cmd% %SHLS_ROOT_DIR%\smarthls-library\external\vision\precompiled_sw_libraries\opencv4.5.4-riscv_64"
set "cmd=%cmd% root@%BOARD_IP%:/usr/local/shls_sw_dependencies"
echo %cmd%
%cmd%

REM Copy sudoers file
set "cmd=scp %SSH_OPT% "
set "cmd=%cmd% ../sev-kit-reference-design/script_support/additional_configurations/smarthls/www/h264/0001_daemon"
set "cmd=%cmd% root@%BOARD_IP%:/etc/sudoers.d/"
echo %cmd%
%cmd%

REM Copy website files
set "cmd=scp -r %SSH_OPT% "
set "cmd=%cmd% ../sev-kit-reference-design/script_support/additional_configurations/smarthls/www/h264 "
set "cmd=%cmd% root@%BOARD_IP%:/srv/www/test"
echo %cmd%
%cmd%

REM Copy HLS binaries
set "cmd=scp %SSH_OPT% "
set "cmd=%cmd% ./*.elf "
set "cmd=%cmd% root@%BOARD_IP%:/srv/www/test/h264/"
echo %cmd%
%cmd%

REM Update ownership
ssh %SSH_OPT% root@%BOARD_IP% chown -R daemon /srv/www/test
ssh %SSH_OPT% root@%BOARD_IP% chgrp -R daemon /srv/www/test

echo "-------"
echo "Reboot the CPU by issuing the RESET command on the HSS command prompt via UART"
echo "- or-"
echo "Just power cycle the board"


