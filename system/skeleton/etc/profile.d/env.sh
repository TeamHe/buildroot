# !/bin/sh

export PATH="$PATH:/usr/local/bin:/home/linux/wkdir/board/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib:/home/linux/wkdir/board/lib"

path="/home/linux"
server="192.168.2.3:/home/linux"


if grep -qs $path /proc/mounts ; then
	return
else
	if [ ! -d $path ]; then
		mkdir $path -p
	fi;
	mount -t nfs -o nolock $server $path
fi;



#bin_path="/home/linux/valgrind/bin"
#lib_path="/home/linux/valgrind/lib"
#if echo $PATH | grep $bin_path ; then
#	return
#else
#	export PATH=$PATH:/home/linux/valgrind/bin
#	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/linux/valgrind/lib
#fi;	

