#!/bin/bash

devicenum=$(xinput | grep Touchpad | awk '{print $6}' | sed 's/id=//')
declare -i state
state=$(xinput list-props $devicenum | grep 'Device Enabled' | awk '{print $4}')
if [ $state -eq 1 ]
then
  xinput disable $devicenum
  echo "Touchpad disabled."
  notify-send "Touchpad disabled."
else
  xinput enable $devicenum
  echo "Touchpad enabled."
  notify-send "Touchpad enabled."
fi
