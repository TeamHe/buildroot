#! /bin/sh
#
# input io init
#


case "$1" in
        start)
                echo "Init Input gpio ..."
				
				#switch init 
				echo 2 > /sys/class/gpio/export	#KSEL0 --A2
				echo 3 > /sys/class/gpio/export	#KSEL1 --A3

				#Di init
 				echo 18  > /sys/class/gpio/export	#CDI1 	--A18     18
				echo 117 > /sys/class/gpio/export	#CDI2 	--D21 	  117
				echo 119 > /sys/class/gpio/export	#CDI3 	--D23 	  119
				echo 79  > /sys/class/gpio/export	#CDI4   --C15     79
				echo 24  > /sys/class/gpio/export	#CDI5 	--A24     24
				echo 74  > /sys/class/gpio/export	#CDI6 	--C10     74
				echo 75  > /sys/class/gpio/export	#CDI7 	--C11 	  75
				echo 92  > /sys/class/gpio/export	#CDI8 	--C28 	  92	
				


                ;;
        stop)
                #do nothing
                ;;
        *)
                echo "Usage: $0 {start|stop}"
                exit 1
esac

exit $?

