/srv/www/test/h264/stop.sh > /srv/www/test/h264/kill_messages.log

#
# Start HLS main() code here 
#
IP_CLIENT="192.168.1.1"
test ${1} && IP_CLIENT=${1}

nPixels=${2}
hreso=${3}
vreso=${4}
datapath=${5}
sobel=${6}
do_invert=${7}
thresh=${8}
watermark=${9}
rotozoom=${10}

echo "IP client:$IP_CLIENT"
echo "hreso:$hreso"
echo "vreso:$vreso"
echo "nPixels:$nPixels"
echo "datapath:$datapath"
echo "watermark:$watermark"
echo "rotozoom:$rotozoom"
# Hardcode resolution to 640x480
# echo 307200   >   /srv/www/test/h264/hls.hls_pipeline.config

echo $nPixels   >   /srv/www/test/h264/hls.hls_pipeline.config
echo $sobel     >>  /srv/www/test/h264/hls.hls_pipeline.config
echo $do_invert >>  /srv/www/test/h264/hls.hls_pipeline.config
echo $thresh    >>  /srv/www/test/h264/hls.hls_pipeline.config
echo $watermark >>  /srv/www/test/h264/hls.hls_pipeline.config
echo $rotozoom >>   /srv/www/test/h264/hls.hls_pipeline.config

source ./setup_vars.sh

if [ "$datapath" = "1" ]; then 
echo "datapath:CPU"
./app_hls_pipeline.cpu.elf > /srv/www/test/h264/app_hls_pipeline.log 2>&1 &
else
echo "datapath:FPGA"
./app_hls_pipeline.fpga.elf > /srv/www/test/h264/app_hls_pipeline.log 2>&1 &
fi

devmem2 0x40001078 w $hreso >/dev/null
devmem2 0x4000107C w $vreso >/dev/null
ffmpeg -nostats -i /dev/video0 -c:v copy -f rtp -sdp_file video.sdp "rtp://$IP_CLIENT:10000" </dev/null  >/srv/www/test/h264/ffmpeg.messages.log 2>/srv/www/test/h264/ffmpeg.error.log &
# ffmpeg -nostats -i /dev/video0 -c:v copy -f rtp -sdp_file video.sdp "rtp://$IP_CLIENT:10000" </dev/null  &

# Save it to a file
# ffmpeg -nostats -i /dev/video0 -c:v copy /srv/www/test/h264/test.mp4
# This can be played back from VLC as "http://$BOARD_IP/test/h264/test.mp4"

# Using just UDP w/AVI encap
# ffmpeg -nostats -i /dev/video0 -c:v copy -f avi "udp://$IP_CLIENT:10001" </dev/null  >/srv/www/test/h264/ffmpeg.messages.log 2>/srv/www/test/h264/ffmpeg.error.log &
# This can be played in Linux like this:
#   ffplay -i udp://$IP_CLIENT:10001

# Using TCP w/mpegts encap
# ffmpeg -nostats -i /dev/video0 -c:v copy -f mpegts "tcp://$IP_CLIENT:10001" </dev/null  >/srv/www/test/h264/ffmpeg.messages.log 2>/srv/www/test/h264/ffmpeg.error.log &
# This can be played in Linux like this, but it has to run before the ffmpeg starts transmitting
#   ffplay -listen 1 tcp://$IP_CLIENT:10001



v4l2-ctl -d /dev/v4l-subdev0 --set-ctrl=vertical_blanking=1170
v4l2-ctl -d /dev/video0 --set-ctrl=gain_automatic=1
# v4l2-ctl -d /dev/video0 --set-ctrl=gain_automatic=1 --set-fmt-video=width=$hreso,height=$vreso

