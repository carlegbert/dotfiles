if [[ $(acpi -b) == *"Discharging"* && $(acpi -b | awk '{print ($(NF-2)-0)}') -lt "15" ]]; then
  notify-send "LOW BATTERY" "$(acpi -b | awk '{ print $5 }') remaining"
fi
