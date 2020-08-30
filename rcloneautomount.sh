#!/bin/bash

echo "Started Rclone Auto Mount service"

wget -q --spider http://google.com

if [ $? -eq 0 ]; then
	if [ ! -d /mnt/media/Anime ]; then
    echo "RClone got Internet"
   rclone mount crypt_media: /mnt/media  --config /home/makishima/.config/rclone/rclone.conf --dir-cache-time 48h --vfs-read-chunk-size 16M --vfs-read-chunk-size-limit 2G --buffer-size 512M 
   #rclone mount crypt_backup_2019-20_acer: /mnt/bckup_acer_rclone --config /home/makishima/.config/rclone/rclone.conf --dir-cache-time 48h --vfs-read-chunk-size 16M --vfs-read-chunk-size-limit 2G --buffer-size 512M 
	fi
else
    echo "RClone got no Internet"
fi


