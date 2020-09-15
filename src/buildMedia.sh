#!/bin/sh
if [[ -z "$build_dev" ]]
then
	echo "Please set \$build_dev"
 
else
    echo "Erasing First 32Mb for boot images"
    dd if=/dev/zero of=${build_dev} bs=1M count=32
    echo "Layout Partiion Table"
    sfdisk ${build_dev} --force < build_media.sfdisk.out
    root_fs_dev="${build_dev}1"

    echo "Creating ext4 fs"
    mkfs.ext4 ${root_fs_dev}

    echo "Mount FS and copy Arch /"
    mkdir -p /build/root
    mount ${root_fs_dev} /build/root
    bsdtar -xpf ArchLinuxARM-aarch64-latest.tar.gz -C /build/root
    sync

    echo "Copy boot files"
    rsync -mir boot/* /build/root/boot/
    

    echo "Find and set the UUID of ${root_fs_dev} for boot.txt"
    fs_uuid=$(blkid -o value -s UUID ${root_fs_dev})
    sed "s/##ROOTUUID##/${fs_uuid}/g" boot.txt.template > /build/root/boot/boot.txt

    echo "Build the boot image"
    cd /build/root/boot
    mkimage -A arm -O linux -T script -C none -n "U-Boot boot script" -d boot.txt boot.scr
    umount /build/root/

    echo "Copy uboot and trust images from #hexdump"
    dd if=/build/src/img/rksd_loader.img of=${build_dev} seek=64 conv=notrunc
    sync
    dd if=/build/src/img/uboot-rk3318.img of=${build_dev} seek=16384 conv=notrunc
    sync
    dd if=/build/src/img/trust.img  of=${build_dev} seek=24576 conv=notrunc
    sync
    umount /build/root/
    mount | grep /build/root
    echo "Sometimes it take a while to unmount so if ${root_fs_dev} /build/root/ is listed above run:"
    echo " umount /build/root/"
    
fi