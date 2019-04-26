# !/bin/sh

dev_mtd_no=6
dev_mtd="/dev/mtd6"
dev_ubi="/dev/ubi1_0"
mount_path="/mnt/data"


mount_ubi() {

	# mount the last mtd
	if [ ! -d $mount_path ];then
		mkdir $mount_path
	fi
	
	ubiattach /dev/ubi_ctrl -m $dev_mtd_no 
	mount -t ubifs $dev_ubi $mount_path
	
	if [ $? -ne 0 ]; then
		echo "flash->data mount fail!! rebuiformat flash->data"
		ubidetach -m $dev_mtd_no 
		ubiformat $dev_mtd
		ubiattach /dev/ubi_ctrl -m $dev_mtd_no
		ubimkvol  /dev/ubi1 -s 85MiB -N my_ubi_vol
		mount -t ubifs $dev_ubi $mount_path
	else
		echo "flash->data mount success!!"
	fi;	
}

case "$1" in
    start)
		if grep -qs $mount_path /proc/mounts; then
			return
		fi
		mount_ubi
		;;
	stop)
		if grep -qs $mount_path /proc/mounts; then
			umount $mounts_path	
		fi
		;;
esac

exit $?

