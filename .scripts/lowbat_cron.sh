#!/bin/bash
#
# check if battery is low, and notify-send if it is. to use, assign to a cronjob.
# you will need to preface with `export DISPLAY=:0 &&` in the cronjob because of notify-send.

battlevel=$(acpi -b)
if [[ "$battlevel" == *"Discharging"* && $(echo "$battlevel" | awk '{print ($(NF-2)-0)}') -lt "15" ]]; then
  notify-send "LOW BATTERY" "$(echo "$battlevel" | awk '{ print $5 }') remaining"
fi
