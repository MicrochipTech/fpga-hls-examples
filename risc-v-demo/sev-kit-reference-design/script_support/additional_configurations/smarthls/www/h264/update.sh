/usr/bin/v4l2-ctl -d /dev/video0 --set-ctrl=quality_factor=30 --set-ctrl=brightness=137 --set-ctrl=contrast=154 --set-ctrl=gain_red=122 --set-ctrl=gain_green=102 --set-ctrl=gain_blue=138
devmem2 0x40001078 w 1280 >/dev/null
devmem2 0x4000107C w 720 >/dev/null
echo -e \
"921600\n"\
"off\n"\
"off\n"\
"0\n"\
"off\n"\
"off\n"\
> ./hls.hls_pipeline.config