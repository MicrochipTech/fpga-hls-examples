#!/bin/bash

set -ex

scp -r h264 root@$BOARD_IP:/srv/www/test/
ssh root@$BOARD_IP "chown daemon /srv/www/test/h264/*; chgrp daemon /srv/www/test/h264/*"

echo "ALL DONE!"
