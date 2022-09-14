#!/usr/bin/env bash
# Ping devices
#========================( IP )==========================
lan=192.168.1.18
#====================( Functions )=======================
isRange(){		# Checks if there is a range of ips divided by -
if [ $2 ] && [ $2 = '-' ]; then
    echo '1'	# Range of IPs
   else
    echo '0'	# Single IP
fi
}

SingleIpPing(){		# Pings single ip and outputs if it's down or not
timeout 0.1 ping $lan.$1 -c 1 1>/dev/null 2>&1
if [ $? = 0 ]; then
    echo "$lan.$1  UP"
   else
    echo "$lan.$1 DOWN !!!"
fi
}

RangeIpPing(){		# Loop for pinging range
min=$1
max=$3
for ((i=$min;i<=$max;i++));do
    SingleIpPing $i
done
}

PINGALL(){		# Sends data to previous funcitons
while [ $1 ]; do
    res=`isRange $1 $2 $3`
    if [ $res = 0 ]; then
        SingleIpPing $1; shift
       else
        RangeIpPing $1 $2 $3; shift; shift; shift
    fi
done
}
#====================( Main body )=======================
params=`echo $* | sed 's/-/ - /g'`
PINGALL $params | column -t
