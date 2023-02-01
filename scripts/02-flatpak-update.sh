#!/bin/bash
set -Eeuo pipefail
trap "echo -e \"\033[1;31m[!] \e[0mScript error occured in $0.\"" ERR

BLUE="\033[1;34m"
RED="\033[1;31m"
ENDCOLOR="\e[0m"

# Update Flatpak packages if it is installed.
if command -v flatpak &> /dev/null
then
    echo -ne $BLUE"[i] "$ENDCOLOR; echo "Updating Archlinux packages"
    sudo flatpak update
else
    echo -ne $RED"[!] "$ENDCOLOR; echo "Flatpak not installed"
fi
