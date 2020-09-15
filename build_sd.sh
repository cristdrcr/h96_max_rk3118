
#!/bin/sh
#Lets be nice and only download these once :)
if ! [ -f src/ArchLinuxARM-aarch64-latest.tar.gz ];
then
  curl -L http://os.archlinuxarm.org/os/ArchLinuxARM-aarch64-latest.tar.gz --output src/ArchLinuxARM-aarch64-latest.tar.gz 
fi
if ! [ -f src/boot/boot.scr ];
then
  curl -L  http://os.archlinuxarm.org/os/rockchip/boot/rock64/boot.scr --output src/boot/boot.scr
fi
umount /dev/sdb1
#docker build . -t h96builder 
docker run -it -h h96_builder --device=/dev/sdb --device=/dev/sdb1 --privileged h96builder ./buildMedia.sh
