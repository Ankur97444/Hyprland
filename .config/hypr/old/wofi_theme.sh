#!/bin/bash

# Path constant
BaseDir=`dirname $(realpath $0)`
confDir="$HOME/.config/"


# Theme declaration
option0=" Arc"
option1=" ArcDark"
option2=" CatppuccinMocha"
option3=" Dracula"
option4=" Everforest"
option5=" Gruvbox"
option6=" Kripton"
option7="TokyoNight"

# Confirm options
Yes='   YES'
No='   NO'


# wofi CMD
wofi_cmd() {
	wofi --dmenu -p Colorscheme -s ~/.config/wofi/style.css -W 250 -H 350 --location 2 -x 0 -y 20 -k /dev/null
}

# Confirmation CMD
confirm_cmd() {
	wofi --dmenu -p "Confirm Theme" -s ~/.config/wofi/style.css
}

# Ask for confirmation
confirm_exit() {
	echo -e "$Yes\n$No" | confirm_cmd
}

# Pass variables to wofi dmenu
run_wofi() {
	echo -e "$option0\n$option1\n$option2\n$option3\n$option4\n$option5\n$option6\n$option7" | wofi_cmd
}



# Set Theme Function
setTheme() {

    # hyprland
    ln -fs $confDir/hypr/themes/${1}.conf $confDir/hypr/themes/theme.conf
    hyprctl reload

    # hyprlock
    ln -fs $confDir/hypr/themes/colors/${1}.conf $confDir/hypr/themes/colors/color.conf

    # rofi
    ln -fs $confDir/rofi/themes/${1}.rasi $confDir/rofi/themes/theme.rasi

    # kitty
    ln -fs $confDir/kitty/themes/${1}.conf $confDir/kitty/themes/theme.conf
    killall -SIGUSR1 kitty

    # Foot Terminal
    ln -fs $confDir/foot/themes/${1}.ini $confDir/foot/themes/theme.ini

    # zathura
    zathuraconf -f $confDir/zathura/theme/${1}.json

    # wofi
    ln -fs $confDir/wofi/themes/${1}.css $confDir/wofi/themes/theme.css

    # swaync
    ln -fs $confDir/swaync/themes/${1}.css $confDir/swaync/themes/theme.css
    swaync-client -R & swaync-client -rs

    # waybar
    ln -fs $confDir/waybar/themes/${1}.css $confDir/waybar/themes/theme.css
    killall waybar & sleep 2
    hyprctl dispatch exec waybar


    # Notify
    notify-send -u normal Theme "Colorscheme set to ${1}"
}



# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$Yes" ]]; then

		if [[ ${1} == '--Arc' ]]; then
			setTheme "Arc"

		elif [[ ${1} == '--ArcDark' ]]; then
			setTheme "ArcDark"

		elif [[ ${1} == '--CatppuccinMocha' ]]; then
			setTheme "CatppuccinMocha"

        elif [[ ${1} == '--Dracula' ]]; then
            setTheme "Dracula"

		elif [[ ${1} == '--Everforest' ]]; then
			setTheme "Everforest"

        elif [[ ${1} == '--Gruvbox' ]]; then
            setTheme "Gruvbox"

        elif [[ ${1} == '--Kripton' ]]; then
            setTheme "Kripton"
        elif [[ ${1} == '--TokyoNight' ]]; then
            setTheme "TokyoNight"

		fi
	else
        exit 0
	fi
}

# Actions
chosen="$(run_wofi)"
case ${chosen} in
    $option0)
		run_cmd --Arc ;;
    $option1)
		run_cmd --ArcDark ;;
    $option2)
		run_cmd --CatppuccinMocha ;;
    $option3)
		run_cmd --Dracula ;;
    $option4)
        run_cmd --Everforest ;;
    $option5)
		run_cmd --Gruvbox ;;
    $option6)
        run_cmd --Kripton ;;
    $option7)
        run_cmd --TokyoNight ;;
esac




