#!/bin/bash
#
# Check if battery is low, and notify-send if it is. To use, assign to a cronjob.
# you will need to preface with `export DISPLAY=:0 &&` in the cronjob because of notify-send.
# A crontab entry might look like this:
# */3 * * * * export DISPLAY=:0 && /bin/bash $HOME/.scripts/lowbat_cron.sh

battlevel=$(acpi -b)
if [[ "$battlevel" == *"Discharging"* && $(echo "$battlevel" | awk '{print ($(NF-2)-0)}') -lt "15" ]]; then
  notify-send "LOW BATTERY" "$(echo "$battlevel" | awk '{ print $5 }') remaining"
fi
