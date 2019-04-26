# !/bin/sh

case "$1" in
        start)
				echo "start collect service"
#				start-stop-daemon -S -q -m -b -p /var/run/collect.pid --exec /usr/local/bin/collect -- 
				/usr/local/bin/collect &
                ;;
        stop)
				echo "stop collect service"
				start-stop-daemon -K -q -p /var/run/collect.pid

                ;;
        restart)
				$0 stop
				sleep 1
				$0 start
                exit 1
esac

