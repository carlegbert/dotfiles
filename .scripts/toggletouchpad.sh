#!/bin/bash

devicenum=$(xinput | grep Touchpad | awk '{print $6}' | sed 's/id=//')
declare -i STATE
STATE=`xinput list-props $devicenum | grep 'Device Enabled' | awk '{print $4}'`
if [ $STATE -eq 1 ]
then
    xinput disable $devicenum
    echo "Touchpad disabled."
else
    xinput enable $devicenum
    echo "Touchpad enabled."
fi
