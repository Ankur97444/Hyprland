#!/bin/bash

# Path constant
BaseDir=`dirname $(realpath $0)`
confDir="$HOME/.config/"

dir="$HOME/.config/rofi/ThemeSelect"
theme='style-1'


# Theme declaration
option0=" Default"
option1=" CatppuccinMocha"
option2=" Dracula"
option3=" Everforest"
option4=" Gruvbox"
option5=" Nordic"
option6=" SweetAmber"
option7=" TokyoNight"

# Confirm options
Yes='  YES'
No='  NO'


# rofi CMD
rofi_cmd() {
    rofi -dmenu -i \
        -p "Theme:" \
        -msg "Change Theme" \
        -theme ${dir}/${theme}.rasi
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 300px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${dir}/${theme}.rasi

}

# Ask for confirmation
confirm_exit() {
	echo -e "$Yes\n$No" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option0\n$option1\n$option2\n$option3\n$option4\n$option5\n$option6\n$option7" | rofi_cmd
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
    # ln -fs $confDir/foot/themes/${1}.ini $confDir/foot/themes/theme.ini
    # killall foot
    # hyprctl dispatch exec foot

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

		if [[ ${1} == '--Default' ]]; then
			setTheme "Default"

		elif [[ ${1} == '--CatppuccinMocha' ]]; then
			setTheme "CatppuccinMocha"

        elif [[ ${1} == '--Dracula' ]]; then
            setTheme "Dracula"

		elif [[ ${1} == '--Everforest' ]]; then
			setTheme "Everforest"

        elif [[ ${1} == '--Gruvbox' ]]; then
            setTheme "Gruvbox"

        elif [[ ${1} == '--Nordic' ]]; then
            setTheme "Nordic"

		elif [[ ${1} == '--SweetAmber' ]]; then
			setTheme "SweetAmber"

        elif [[ ${1} == '--TokyoNight' ]]; then
            setTheme "TokyoNight"

		fi
	else
        exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option0)
		run_cmd --Default ;;
    $option1)
		run_cmd --CatppuccinMocha ;;
    $option2)
		run_cmd --Dracula ;;
    $option3)
        run_cmd --Everforest ;;
    $option4)
		run_cmd --Gruvbox ;;
    $option5)
        run_cmd --Nordic ;;
    $option6)
		run_cmd --SweetAmber ;;
    $option7)
        run_cmd --TokyoNight ;;
esac




