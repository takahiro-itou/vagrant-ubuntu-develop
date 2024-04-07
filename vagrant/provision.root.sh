#! /bin/bash  -xue

test  -f /root/.provision.root  &&  exit 0

echo  Provisioning $HOSTNAME

sudo  timedatectl  set-timezone Asia/Tokyo
sudo  timedatectl  set-ntp  true
sudo  systemctl restart systemd-timesyncd.service
sleep 4
systemctl status  systemd-timesyncd.service
sleep 4

date  >  /root/.provision.root
