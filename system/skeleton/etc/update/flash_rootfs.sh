# !/bin/sh

if [ "$1" = "os1" ]; then 
	kernel_dev='/dev/mtd2'
	rootfs_dev='/dev/mtd3'
else
	kernel_dev='/dev/mtd4'
	rootfs_dev='/dev/mtd5'
fi;

dtb_path="/mnt/emmc/images/sama5d36ek.dtb"
kernel_path='/mnt/emmc/images/zImage'
rootfs_path='/mnt/emmc/images/rootfs.ubi'

page_size=0x20000
dtb_size=0x80000
kernel_size=0x780000
rootfs_size=0x4800000

if [ -f  $dtb_path ]; then
	echo write dtb
#	dtb_pages='expr$dtb_size/$page_size'
#	((dtb_pages=))
#echo dtb pages )

	flash_erase $kernel_dev 0 $(($dtb_size/$page_size))
	nandwrite -p $kernel_dev $dtb_path
fi;


if [ -f  $kernel_path ]; then
	echo write kernel
	flash_erase $kernel_dev	$dtb_size $(($kernel_size / $page_size))   
	nandwrite -p -s 0x80000 $kernel_dev $kernel_path
fi;

if [ -f $rootfs_path ]; then
	echo write rootfs
	flash_erase $rootfs_dev 0  $(($rootfs_size / $page_size))  
	ubiformat $rootfs_dev -f $rootfs_path
fi;

