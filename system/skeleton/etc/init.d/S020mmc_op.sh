# !/bin/sh
#
#

dev="/dev/mmcblk0"
path="/mnt/emmc"

format(){
	echo "Start format "
	if grep -qs $2 /proc/mounts; then
		umount $2 
	fi
	mkfs.fat $1 
	mount $1 $2 
	echo "Format & mount /dev/mmcblk0 success"
}

if [ ! -e $dev ];then
	echo "emmc mount check error: device $dev not exist."
	exit 0	
fi

if [ ! -d $path ];then
	mkdir $path 
fi

case "$1" in
    start)
		if grep -qs $path /proc/mounts; then
			echo "$dev has already mounted"
		else
			
        	echo "mount mmcblk0 ..."
			if mount $dev $path ;then
				echo "Mount $dev success"
			else
				format $dev $path	
			fi
		fi
        ;;
    stop)
		echo "umount $path"
		if grep -qs $path /proc/mounts; then
			umount $path 
		fi
        ;;

	format)
		format $dev $path
		;;
    *)
         echo "Usage: $0 {start|stop|fromat}"
esac

exit $?


