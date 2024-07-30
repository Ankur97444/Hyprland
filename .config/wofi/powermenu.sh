#!/usr/bin/env bash

#
## wofi   : Power Menu
#
# CMDs
host=`uname -n`

# Options
option1='   Shutdown'
option2='   Reboot'
option3='   LockScreen'
option4='   Suspend'
option5='   Standby'
option6='   Logout'
Yes='   YES'
No='   NO'

# wofi CMD
wofi_cmd() {
	wofi --dmenu -p Goodbye -s ~/.config/wofi/style.css -W 200 -H 350 --location 3 -x -30 -y 5 -k /dev/null
}

# Confirmation CMD
confirm_cmd() {
	wofi --dmenu -p Confirmation -s ~/.config/wofi/style.css
}

# Ask for confirmation
confirm_exit() {
	echo -e "$Yes\n$No" | confirm_cmd
}

# Pass variables to wofi dmenu
run_wofi() {
	echo -e "$option1\n$option2\n$option3\n$option4\n$option5\n$option6" | wofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$Yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
		elif [[ $1 == '--suspend' ]]; then
			mpc -q pause
			amixer set Master mute
			hyprlock && systemctl suspend
        elif [[ $1 == '--standby' ]]; then
            hyprctl dispatch dpms off
		elif [[ $1 == '--logout' ]]; then
			hyprctl dispatch exit 0
		fi
	else
		exit 0
	fi
}

# Actions
chosen="$(run_wofi)"
case ${chosen} in
    $option1)
		run_cmd --shutdown
        ;;
    $option2)
		run_cmd --reboot
        ;;
    $option3)
		hyprlock
        ;;
    $option4)
		run_cmd --suspend
        ;;
    $option5)
        run_cmd --standby
        ;;
    $option6)
		run_cmd --logout
        ;;
esac
