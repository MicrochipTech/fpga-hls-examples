$ErrorActionPreference = 'Stop'

# Set BOARD_IP if not already defined
if (-not (Test-Path env:BOARD_IP)) {
    $env:BOARD_IP = "192.168.2.1"
}

# SSH options
$SSH_OPT = "-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR"

# Find the path to shls.bat
$SHLS_PATH = (Get-Command shls.bat).Source
$SHLS_ROOT_DIR = Split-Path -Parent $SHLS_PATH | Split-Path -Parent

# Remote command execute over ssh

# Create the necessary directories
ssh  $SSH_OPT root@$env:BOARD_IP "rm -rf /usr/local/shls_sw_dependencies"
ssh  $SSH_OPT root@$env:BOARD_IP "rm -rf /srv/www/test"
ssh  $SSH_OPT root@$env:BOARD_IP "mkdir -p /usr/local/shls_sw_dependencies"
ssh  $SSH_OPT root@$env:BOARD_IP "mkdir -p /srv/www/test"

# Now copy the necessary files to the board
$cmd = "scp -O -r $SSH_OPT "
$cmd += "$SHLS_ROOT_DIR\smarthls-library\external\vision\precompiled_sw_libraries\ffmpeg4.4-riscv_64 "
$cmd += "$SHLS_ROOT_DIR\smarthls-library\external\vision\precompiled_sw_libraries\opencv4.5.4-riscv_64 "
$cmd += "root@$env:BOARD_IP"
$cmd += ":/usr/local/shls_sw_dependencies"
Write-Host $cmd
Invoke-Expression $cmd

# Copy sudoers file
$cmd = "scp -O $SSH_OPT "
$cmd += "../sev-kit-reference-design/script_support/additional_configurations/smarthls/www/h264/0001_daemon "
$cmd += "root@$env:BOARD_IP"
$cmd += ":/etc/sudoers.d/"
Write-Host $cmd
Invoke-Expression $cmd

# Copy website files
$cmd = "scp -O -r $SSH_OPT "
$cmd += "../sev-kit-reference-design/script_support/additional_configurations/smarthls/www/h264 "
$cmd += "root@$env:BOARD_IP"
$cmd += ":/srv/www/test"
Write-Host $cmd
Invoke-Expression $cmd

# remove dos endings from copied sudoers file
ssh  $SSH_OPT root@$env:BOARD_IP "sed -i 's/\x0D$//' /etc/sudoers.d/0001_daemon"

# Copy HLS binaries
$cmd = "scp -O $SSH_OPT "
$cmd += "./*.elf "
$cmd += "root@$env:BOARD_IP"
$cmd += ":/srv/www/test/h264/"
Write-Host $cmd
Invoke-Expression $cmd

# Update ownership
ssh  $SSH_OPT root@$env:BOARD_IP "chown -R daemon /srv/www/test"
ssh  $SSH_OPT root@$env:BOARD_IP "chgrp -R daemon /srv/www/test"
ssh  $SSH_OPT root@$env:BOARD_IP "chmod -R 755 /srv/www/test"

Write-Host "-------"
Write-Host "Reboot the CPU by issuing the RESET command on the HSS command prompt via UART"
Write-Host "- or-"
Write-Host "Just power cycle the board"