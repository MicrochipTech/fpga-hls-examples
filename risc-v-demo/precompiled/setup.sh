#!/bin/bash

set -e

BOARD_IP=${BOARD_IP:-192.168.2.1}

SSH_OPT=" -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR "

# Remote command execute over ssh

# Create the necessary directories
cmd="ssh $SSH_OPT root@$BOARD_IP \""
cmd+="rm -rf /usr/local/shls_sw_dependencies;"
cmd+="rm -rf /srv/www/test;"
cmd+="mkdir -p /usr/local/shls_sw_dependencies;"
cmd+="mkdir -p /srv/www/test;\""
echo $cmd
eval $cmd

# Now copy the necessary files to the board
cmd="scp -r $SSH_OPT "
cmd+=" shls_sw_dependencies/ffmpeg4.4-riscv_64"
cmd+=" shls_sw_dependencies/opencv4.5.4-riscv_64"
cmd+=" root@$BOARD_IP:/usr/local/shls_sw_dependencies"
echo $cmd
eval $cmd

# Copy sudoers file
cmd="scp $SSH_OPT "
cmd+="../sev-kit-reference-design/script_support/additional_configurations/smarthls/www/h264/0001_daemon"
cmd+=" root@$BOARD_IP:/etc/sudoers.d/"
echo $cmd
eval $cmd

# Copy website files
cmd="scp -r $SSH_OPT "
cmd+="../sev-kit-reference-design/script_support/additional_configurations/smarthls/www/h264 "
cmd+=" root@$BOARD_IP:/srv/www/test"
echo $cmd
eval $cmd

# Copy HLS binaries
cmd="scp $SSH_OPT "
cmd+="./*.elf "
cmd+=" root@$BOARD_IP:/srv/www/test/h264/"
echo $cmd
eval $cmd

# Update ownership
cmd="ssh $SSH_OPT root@$BOARD_IP \""
cmd+=" chown -R daemon /srv/www/test;"
cmd+=" chgrp -R daemon /srv/www/test;\""
echo $cmd
eval $cmd

echo "-------"
echo "Reboot the CPU by issuing the RESET command on the HSS command prompt via UART"
echo "- or-"
echo "Just power cycle the board"


