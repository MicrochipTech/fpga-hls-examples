ffplay -protocol_whitelist file,rtp,udp -reorder_queue_size 0  -fflags discardcorrupt -fflags nobuffer -flags low_delay -i ./video.sdp
