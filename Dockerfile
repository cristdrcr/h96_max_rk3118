FROM archlinux:latest

# Update the repositories
RUN	 pacman -Syy

# Install Base utils
RUN pacman -S --noconfirm rsync wget uboot-tools base-devel

# CREATE BUILD ROOT
RUN mkdir /build
RUN mkdir -p /build/root
RUN mkdir -p /build/src/boot
WORKDIR /build

# Lets be nice and only download these once :) 
# Can be called here but lets pull them into 
# local src tree instead to save pulling each build
#RUN curl -L http://os.archlinuxarm.org/os/ArchLinuxARM-aarch64-latest.tar.gz --output src/ArchLinuxARM-aarch64-latest.tar.gz 
#RUN curl -L  http://os.archlinuxarm.org/os/rockchip/boot/rock64/boot.scr --output src/boot/boot.scr


COPY src /build/src






ENV build_dev /dev/sdb
WORKDIR /build/src
