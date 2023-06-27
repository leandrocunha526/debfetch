#!/bin/bash

# Include 'os-release' to grab Debian pretty name

pkg_total=$(dpkg-query -W -f='${Section}\t${Package}\n' | wc -l)
pkg_nonfree=$(dpkg-query -W -f='${Section}\t${Package}\n' | grep -c '^non-free')
pkg_contrib=$(dpkg-query -W -f='${Section}\t${Package}\n' | grep -c '^contrib')
pkg_firmware=$(dpkg-query -W -f='${Section}\t${Package}\n' | grep -c '^non-free-firmware')
last_update=$(date -r /var/cache/apt/pkgcache.bin +'%b %d, %Y %R')

[[ $pkg_nonfree -eq 0 && $pkg_config -eq 0 ]] && vrms="RMS would be proud!"

clear

. /etc/os-release

# Styles

bold="$(tput bold)"
reset="$(tput sgr0)"
red="$(tput setaf 1)"

packages="
 ${bold} Packages: $pkg_total \
 (non-free: $pkg_nonfree \
 contrib: $pkg_contrib
 non-free-firmware: $pkg_firmware) ${bold}$vrms
 ${bold} Last update: $last_update
"

# Get terminal col width

cols=$(tput cols)

clear

echo "
$red ⢀⣴⠾⠻⢶⣦⠀  $reset ${red}User: $USER${reset}
$red ⣾⠁⢠⠒⠀⣿⡁  $reset ${red}OS:${bold}${reset} $PRETTY_NAME
$red ⢿⡄⠘⠷⠚⠋⠀  $reset ${red}Kernel:${bold}${reset} $(uname -rm)
$red ⠈⠳⣄⠀⠀⠀⠀  $reset ${red}Uptime:${bold}${reset} $(uptime -p | cut -d' ' -f2-)
"

echo "DFSG and VRMS check\n" $packages
