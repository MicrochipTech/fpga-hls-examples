$copy_path="root@" + $env:BOARD_IP + ":/srv/www/test/"
scp -r h264 $copy_path
ssh root@$env:BOARD_IP "chown daemon /srv/www/test/h264/*; chgrp daemon /srv/www/test/h264/*; chmod 755 -R /srv/www/test/"

Write-Output "ALL DONE!"
