v4l2-ctl -d /dev/video0 --set-ctrl=gain_automatic=0
echo -e "$(date)"
echo -e "Start Time: $(date +"%T.%6N")"
echo "Stopping H.264 wrapper..."


# Stop the app, but let it finish one last frame and exit normally such that it
# can release the allocated memory
# killall -s USR1 app_get_put_frame.elf > /dev/null 2>&1
# killall -s USR1 app_sobel.elf > /dev/null 2>&1
killall -s USR1 app_hls_pipeline.cpu.elf > /dev/null 2>&1
killall -s USR1 app_hls_pipeline.fpga.elf > /dev/null 2>&1
sleep 1


# deassert h264_en signal
# devmem2 0x40001084 w 0 >/dev/null


#
# Stop FFMPEG
#
killall -s SIGTERM ffmpeg > /dev/null 2>&1

#
# Stop HLS software
#
# kill -s SIGTERM $(pidof app_invert_and_threshold.elf) > /dev/null 2>&1
# killall -s SIGTERM app_invert_and_threshold.elf > /dev/null 2>&1

#
# Reset the HLS hardware subsystem. 
# Notes: 
#   -   The first sleep is to give some time for outstanding HLS AXI transactions
#       to finish before asserting the reset
#   -   The second sleep is to give time to GPIO to assert the reset signal.
#       Without the delay it doesn't seem to work.
rstPin=1
echo "Reseting HLS subsystem..."
sleep 1
gpioset gpiochip0 $rstPin=1
sleep 1
gpioset gpiochip0 $rstPin=0


echo -e "End Time: $(date +"%T.%6N")"

