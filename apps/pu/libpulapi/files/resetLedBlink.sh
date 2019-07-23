#!/bin/sh
#/* #PegaCVP#, YochengLian, 20190110, Create for NETGEAR-JIRA[RAX40-323] [LED]The status of Power LED is incorrect when reset DUT. */
count=0;
delayCount=0;
oldInternetLedState=`cat /sys/class/gpio/gpio43/value`
timeout=$1
delay=$2
#echo "\$timeout=$timeout"
#echo "\$oldInternetLedState=$oldInternetLedState"

if [ delay != 0 ]; then
    until [ $delayCount = $delay ]; do
    sleep 1
    let delayCount=delayCount+1
    done
fi

if [ $timeout != 0 ]; then
    until [ $count = $timeout ]; do
        echo 1 > /sys/class/gpio/gpio10/value
#        echo 1 > /sys/class/gpio/gpio43/value
        usleep 750000        
        echo 0 > /sys/class/gpio/gpio10/value
#        echo 0 > /sys/class/gpio/gpio43/value
        usleep 250000
        let count=count+1
    done
fi

echo $oldInternetLedState > /sys/class/gpio/gpio43/value

exit 0

