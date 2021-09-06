#!/bin/bash

# Include 'os-release' to grab Debian pretty name

. /etc/os-release

# Styles

bold="$(tput bold)"
reset="$(tput sgr0)"
red="$(tput setaf 1)"

# Get terminal col width

cols=$(tput cols)

clear

echo "
$red ⢀⣴⠾⠻⢶⣦⠀  $reset ${red}User: $USER${reset}
$red ⣾⠁⢠⠒⠀⣿⡁  $reset ${red}OS:${bold}${reset} $PRETTY_NAME
$red ⢿⡄⠘⠷⠚⠋⠀  $reset ${red}Kernel:${bold}${reset} $(uname -rm)
$red ⠈⠳⣄⠀⠀⠀⠀  $reset ${red}Uptime:${bold}${reset} $(uptime -p | cut -d' ' -f2-)
"

printf -- "-%.s" $(seq $cols)

echo "\n"

exit 0
