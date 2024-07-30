#!/bin/bash

# OPTIONS
option0="  Shutdown"
option1="  Reboot"
option2="  LockScreen"
option3="  Logout"
option4="  Suspend"
option5="  Standby"

# Confirm cmd
#yes="Yes"
#no="No"

options="$option0\n$option1\n$option2\n$option3\n$option4\n$option5"


selected=$(echo -e $options|wofi --dmenu -p Search... -W 200 -H 260 --location 3 -x -30 -y 5 -k /dev/null | awk '{print tolower($2)}')

case $selected in
  shutdown)
    systemctl poweroff;;
  reboot)
    systemctl reboot;;
  suspend)
    swaylock && systemctl suspend;;
  standby)
    sleep 1 && hyprctl dispatch dpms off;;
  logout)
    hyprctl dispatch exit 0;;
  lockscreen)
    hyprlock;;
esac
