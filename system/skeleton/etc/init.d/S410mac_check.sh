# !/bin/sh
#
#

p_eth0="eth0"
p_src_eth0="/sys/class/net/eth0/address"
p_dest_eth0="/etc/network/mac_eth0"

p_eth1="eth1"
p_src_eth1="/sys/class/net/eth1/address"
p_dest_eth1="/etc/network/mac_eth1"

save_mac(){
	cp $1 $2
}

set_mac(){
	ifconfig $1 down
	ifconfig $1 hw ether $2
	ifconfig $1 up
}



check_mac(){
	if [ ! -f $2 ];then
		echo "mac config file does not exist. save mac address"
		save_mac $1 $2
	else
		mac1=$(cat $1)
		mac2=$(cat $2)
		
		if [ ! "$mac1" == "$mac2" ];then
			echo "mac is diffrent with config. Set mac ...."
			set_mac $3 $mac2
		else
			echo "mac is same to config."		
		fi	

	fi

}


case "$1" in
        start)
				echo "check eth0 mac address"
				check_mac $p_src_eth0 $p_dest_eth0 $p_eth0 
				echo "check eth1 mac address"
				check_mac $p_src_eth1 $p_dest_eth1 $p_eth1
                ;;
        stop)
                #do nothing
                ;;
        *)
                echo "Usage: $0 {start|stop}"
                exit 1
esac

exit $?
