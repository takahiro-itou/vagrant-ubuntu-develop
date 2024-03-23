#! /bin/bash  -xue

test  -f /root/.provision.root  &&  exit 0

echo  Provisioning $HOSTNAME

sudo  timedatectl  set-timezone Asia/Tokyo
sudo  timedatectl  set-ntp  true
sudo  systemctl restart systemd-timesyncd.service
sleep 4
systemctl status  systemd-timesyncd.service
sleep 1


# RamDisk
sudo  mkdir        /ramdisk
sudo  chmod  1777  /ramdisk
echo  -e  "tmpfs\t/ramdisk\ttmpfs\trw,size=2048m,x-gvfs-show\t0\t0"  \
      |  sudo  tee -a  /etc/fstab
sudo  mount  -a

date  >  /root/.provision.root
