#!/bin/bash

declare -i STATE
STATE=`xinput list-props 11 | grep 'Device Enabled' | awk '{print $4}'`
if [ $STATE -eq 1 ]
then
    xinput disable 11
    echo "Touchpad disabled."
else
    xinput enable 11
    echo "Touchpad enabled."
fi
