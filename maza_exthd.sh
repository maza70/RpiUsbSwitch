#!/bin/bash
run=true

_term() { 
  echo "SIGTERM signal!" 
  run=false
}
trap _term SIGTERM

echo "enable Hd power"
gpio -g mode 16 output
gpio -g write 16 0
echo "wait to spinup"
counter=0
while [ ! -e /dev/sda1 ]; do
    sleep 1
    counter=$((counter + 1))
done


echo "mount to /mnt/exthd"
mount -t ext4 /dev/sda1 /mnt/exthd

echo "HD-Ext is active"
while $run 
do 
   sleep 1
done

echo "HD-Ext is shutdown"

sync 
echo "umount /mnt/exthd"
umount -v /mnt/exthd
echo "flush caches" 
blockdev --flushbufs /dev/sda
hdparm -F /dev/sda
eject -v -s  /dev/sda1
sleep 1
echo "power of hd"
gpio -g mode 16 output
gpio -g write 16 1






