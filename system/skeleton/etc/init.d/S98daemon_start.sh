# !/bin/sh

case "$1" in
        start)
				echo "start daemon service"
				start-stop-daemon -S -q -m -b -p /var/run/coll_daemon.pid --exec /usr/local/bin/daemon -- -n
                ;;
        stop)
				echo "stop daemon service"
				start-stop-daemon -K -q -p /var/run/coll_daemon.pid

                ;;
        restart)
				$0 stop
				sleep 1
				$0 start
                exit 1
esac

