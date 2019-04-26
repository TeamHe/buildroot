#!/bin/sh

#make

echo "cp to tftp floder"
rm -r /opt/fs/buildroot/*
cp -r output/target/* /opt/fs/buildroot/
#cp output/images/zImage /opt/tftpboot/

echo "cp images to shared floder."

cp output/images/rootfs.ubi /home/share/images/
cp output/images/rootfs.ubi /home/linux/wkdir/images/
#cp output/images/zImage /home/linux/wkdir/images/



